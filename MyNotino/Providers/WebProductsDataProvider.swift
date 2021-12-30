//
//  WebProductsDataProvider.swift
//  MyNotino
//
//  Created by Roman Podymov on 23/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import Foundation
import Moya
import PromiseKit

struct WebProductsDataProvider {}

extension WebProductsDataProvider: ProductsDataProvider {
    #if SIMULATE_PAGINATION
    func productsData(page: Int, queue: DispatchQueue) -> Promise<PaginatedProductsData> {
        prepareProductsData(queue: queue).map(on: queue) { data in
            .init(
                productsData: .init(
                    vpProductByIds: data.vpProductByIds?.map { vpProductByIds in
                        VpProductByIds(page: page, vpProductByIds: vpProductByIds)
                    }
                ),
                page: page
            )
        }
    }
    #else
    func productsData(queue: DispatchQueue) -> Promise<ProductsData> {
        prepareProductsData(queue: queue)
    }
    #endif

    private func prepareProductsData(queue: DispatchQueue) -> Promise<ProductsData> {
        let provider = MoyaProvider<MyNotinoWebService>()
        return provider.requestPromise(.products).map(on: queue) {
            try JSONDecoder().decode(ProductsData.self, from: $0)
        }
    }
}

extension MoyaProvider {
    func requestPromise(
        _ target: Target,
        callbackQueue: DispatchQueue? = .none,
        progress: ProgressBlock? = .none
    ) -> Promise<Data> {
        .init { resolver in
            request(target, callbackQueue: callbackQueue, progress: progress) { result in
                switch result {
                case let .success(response):
                    resolver.fulfill(response.data)
                case let .failure(error):
                    resolver.reject(error)
                }
            }
        }
    }
}
