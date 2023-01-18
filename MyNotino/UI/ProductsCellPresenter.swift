//
//  ProductsCellPresenter.swift
//  MyNotino
//
//  Created by Roman Podymov on 07/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import Foundation

protocol ProductsCellView: AnyObject {
    var presenter: ProductsCellPresenter { get }
    func setup(_ data: ProductsCellData)
}

final class ProductsCellPresenter {
    weak var view: ProductsCellView?

    init(view: ProductsCellView?) {
        self.view = view
    }

    func setup(_ data: VpProductByIds?) {
        view?.setup(
            .init(
                imageUrl: data?.imageUrl,
                brandName: data?.brand?.name,
                name: data?.name,
                annotation: data?.annotation,
                averageRating: data?.reviewSummary?.averageRating.map { Int(round($0)) } ?? 0,
                price: data?.price.flatMap {
                    guard let value = $0.value, let currency = $0.currency else {
                        return nil
                    }
                    return String(value) + " " + currency
                }
            )
        )
    }
}
