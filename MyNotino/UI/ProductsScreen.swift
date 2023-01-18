//
//  ProductsScreen.swift
//  MyNotino
//
//  Created by Roman Podymov on 06/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import DifferenceKit
import Fashion
import PureLayout
import Reusable
import UIKit

final class ProductsScreen: UIViewController {
    private enum Constants {
        static let productsCollectionViewCellWidth: CGFloat = 300
        static let productsCollectionViewCellHeight: CGFloat = 450
    }

    private lazy var productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(
            width: Constants.productsCollectionViewCellWidth,
            height: Constants.productsCollectionViewCellHeight
        )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.apply(
            styles: MyNotinoStyle.autolayoutView, MyNotinoStyle.productsScreenGridBase
        )
        collectionView.register(cellType: ProductsCell.self)
        #if SIMULATE_PAGINATION
        collectionView.register(
            supplementaryViewType: ProductsScreenFooter.self,
            ofKind: UICollectionView.elementKindSectionFooter
        )
        collectionView.delegate = presenter
        #endif
        collectionView.dataSource = presenter
        return collectionView
    }()

    private lazy var presenter = ProductsScreenPresenter(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(productsCollectionView)
        productsCollectionView.autoPinEdgesToSuperviewEdges()

        presenter.start()
    }
}

extension ProductsScreen: RootScreen {}

extension ProductsScreen: ProductsScreenView {
    #if SIMULATE_PAGINATION
    func onNewDataReceived(page: Int, productsChangeset: ProductsChangeset) {
        productsCollectionView.reload(using: productsChangeset) { [weak self] data in
            self?.presenter.updateVpProductByIds(page: page, with: data)
        }
    }
    #else
    func onNewDataReceived(productsChangeset: ProductsChangeset) {
        productsCollectionView.reload(using: productsChangeset) { [weak self] data in
            self?.presenter.updateVpProductByIds(with: data)
        }
    }
    #endif
}
