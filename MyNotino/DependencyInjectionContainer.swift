//
//  DependencyInjectionContainer.swift
//  MyNotino
//
//  Created by Roman Podymov on 06/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import Fashion
import Swinject

struct DependencyInjectionContainer {
    static let shared = DependencyInjectionContainer()

    private let container: Container = {
        let container = Container()
        container.register(Stylesheet.self) { _ in MainStylesheet() }
        container.register(RootScreen.self) { _ in ProductsScreen() }
        container.register(ProductsDataProvider.self) { _ in WebProductsDataProvider() }
        container.register(ImagesProvider.self) { _ in KFImagesProvider() }
        return container
    }()

    private init() {}

    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        container.resolve(serviceType)
    }
}
