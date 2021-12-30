//
//  ProductsScreenPresenter.swift
//  MyNotino
//
//  Created by Roman Podymov on 07/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import DifferenceKit
import Reusable
import SwifterSwift
import UIKit

typealias ProductsChangeset = StagedChangeset<[VpProductByIds]>

protocol ProductsScreenView: AnyObject {
    #if SIMULATE_PAGINATION
    func onNewDataReceived(page: Int, productsChangeset: ProductsChangeset)
    #else
    func onNewDataReceived(productsChangeset: ProductsChangeset)
    #endif
}

final class ProductsScreenPresenter: NSObject {
    private enum Constants {
        static let productsScreenFooterHeight: CGFloat = 100
    }

    private weak var view: ProductsScreenView?
    #if SIMULATE_PAGINATION
    private var productsData: PaginatedProductsData?
    #else
    private var productsData: ProductsData?
    #endif

    private let productsDataQueue = DispatchQueue.global(qos: .userInitiated)

    init(view: ProductsScreenView?) {
        super.init()
        self.view = view
    }

    final func start() {
        #if SIMULATE_PAGINATION
        loadProductsData(page: 0)
        #else
        loadProductsData()
        #endif
    }

    #if SIMULATE_PAGINATION
    private func loadProductsData(page: Int) {
        DependencyInjectionContainer.shared.resolve(
            ProductsDataProvider.self
        )?.productsData(
            page: page,
            queue: productsDataQueue
        ).map(
            on: productsDataQueue
        ) { [weak self] in
            guard let self = self else {
                return .init([])
            }
            return self.createProductsChangeset(vpProductByIdsProvider: $0)
        }.done { [weak self] changeset in
            self?.view?.onNewDataReceived(page: page, productsChangeset: changeset)
        }.catch { _ in
        }
    }
    #else
    private func loadProductsData() {
        DependencyInjectionContainer.shared.resolve(
            ProductsDataProvider.self
        )?.productsData(
            queue: productsDataQueue
        ).map(
            on: productsDataQueue
        ) { [weak self] in
            guard let self = self else {
                return .init([])
            }
            return self.createProductsChangeset(vpProductByIdsProvider: $0)
        }.done { [weak self] changeset in
            self?.view?.onNewDataReceived(productsChangeset: changeset)
        }.catch { _ in
        }
    }
    #endif

    private func createProductsChangeset(vpProductByIdsProvider: VpProductByIdsProvider) -> ProductsChangeset {
        ProductsChangeset(
            source: productsData?.vpProductByIds ?? [],
            target: ProductsData.merged(
                one: vpProductByIdsProvider.vpProductByIds,
                into: productsData?.vpProductByIds
            ) ?? []
        )
    }

    #if SIMULATE_PAGINATION
    final func updateVpProductByIds(page: Int, with vpProductByIds: [VpProductByIds]) {
        productsData = .init(productsData: .init(vpProductByIds: vpProductByIds), page: page)
    }
    #else
    final func updateVpProductByIds(with vpProductByIds: [VpProductByIds]) {
        productsData = .init(vpProductByIds: vpProductByIds)
    }
    #endif
}

#if SIMULATE_PAGINATION
extension ProductsScreenPresenter: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout _: UICollectionViewLayout,
        referenceSizeForFooterInSection _: Int
    ) -> CGSize {
        .init(width: collectionView.frame.width, height: Constants.productsScreenFooterHeight)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let view: ProductsScreenFooter = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                for: indexPath
            )
            return view
        }
        return UICollectionReusableView()
    }

    func collectionView(
        _: UICollectionView,
        willDisplaySupplementaryView view: UICollectionReusableView,
        forElementKind elementKind: String,
        at _: IndexPath
    ) {
        if elementKind == UICollectionView.elementKindSectionFooter {
            (view as? ProductsScreenFooter)?.onLoadingStarted()
            loadProductsData(page: productsData.map { $0.page + 1 } ?? 0)
        }
    }

    func collectionView(
        _: UICollectionView,
        didEndDisplayingSupplementaryView view: UICollectionReusableView,
        forElementOfKind elementKind: String,
        at _: IndexPath
    ) {
        if elementKind == UICollectionView.elementKindSectionFooter {
            (view as? ProductsScreenFooter)?.onLoadingFinished()
        }
    }
}
#endif

extension ProductsScreenPresenter: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        productsData?.vpProductByIds?.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell: ProductsCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.presenter.setup(productsData?.vpProductByIds?[safe: indexPath.item])
        return cell
    }
}
