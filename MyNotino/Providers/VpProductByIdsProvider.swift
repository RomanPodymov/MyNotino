//
//  VpProductByIdsProvider.swift
//  MyNotino
//
//  Created by Roman Podymov on 27/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

protocol VpProductByIdsProvider {
    var vpProductByIds: [VpProductByIds]? { get }
}

extension ProductsData: VpProductByIdsProvider {}

#if SIMULATE_PAGINATION
struct PaginatedProductsData {
    let productsData: ProductsData
    let page: Int

    init(productsData: ProductsData, page: Int) {
        self.productsData = productsData
        self.page = page
    }
}

extension PaginatedProductsData: VpProductByIdsProvider {
    var vpProductByIds: [VpProductByIds]? {
        productsData.vpProductByIds
    }
}
#endif
