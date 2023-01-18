//
//  ProductsDataProvider.swift
//  MyNotino
//
//  Created by Roman Podymov on 06/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import Foundation
import PromiseKit

protocol ProductsDataProvider {
    #if SIMULATE_PAGINATION
    func productsData(page: Int, queue: DispatchQueue) -> Promise<PaginatedProductsData>
    #else
    func productsData(queue: DispatchQueue) -> Promise<ProductsData>
    #endif
}
