//
//  Extensions.swift
//  MyNotino
//
//  Created by Roman Podymov on 23/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import DifferenceKit

extension ProductsData {
    init(vpProductByIds: [VpProductByIds]?) {
        self.vpProductByIds = vpProductByIds
    }

    static func merged(one: ProductsData?, into another: ProductsData?) -> ProductsData {
        .init(
            vpProductByIds: Self.merged(one: one?.vpProductByIds, into: another?.vpProductByIds)
        )
    }

    static func merged(one: [VpProductByIds]?, into another: [VpProductByIds]?) -> [VpProductByIds]? {
        another.flatMap { anotherVpProductByIds in
            one.flatMap { oneVpProductByIds in
                anotherVpProductByIds + oneVpProductByIds
            } ?? another
        } ?? one
    }
}

extension VpProductByIds: Differentiable {
    var differenceIdentifier: Int {
        productId ?? 0
    }

    func isContentEqual(to source: VpProductByIds) -> Bool {
        productId == source.productId
    }
}

#if SIMULATE_PAGINATION
extension VpProductByIds {
    init(page: Int, vpProductByIds: VpProductByIds) {
        self.init(
            masterId: vpProductByIds.masterId,
            productCode: vpProductByIds.productCode,
            stockAvailability: vpProductByIds.stockAvailability,
            imageUrl: vpProductByIds.imageUrl,
            name: vpProductByIds.name,
            url: vpProductByIds.url,
            reviewSummary: vpProductByIds.reviewSummary,
            annotation: vpProductByIds.annotation,
            price: vpProductByIds.price,
            productId: vpProductByIds.productId.map { $0 + 30 * page },
            attributes: vpProductByIds.attributes,
            orderUnit: vpProductByIds.orderUnit,
            brand: vpProductByIds.brand
        )
    }

    // swiftlint:disable inclusive_language
    init(
        masterId: Int?,
        productCode: String?,
        stockAvailability: StockAvailability?,
        imageUrl: String?,
        name: String?,
        url: String?,
        reviewSummary: ReviewSummary?,
        annotation: String?,
        price: Price?,
        productId: Int?,
        attributes: Attributes?,
        orderUnit: String?,
        brand: Brand?
    ) {
        self.masterId = masterId
        self.productCode = productCode
        self.stockAvailability = stockAvailability
        self.imageUrl = imageUrl
        self.name = name
        self.url = url
        self.reviewSummary = reviewSummary
        self.annotation = annotation
        self.price = price
        self.productId = productId
        self.attributes = attributes
        self.orderUnit = orderUnit
        self.brand = brand
    }
    // swiftlint:enable inclusive_language
}
#endif
