//
//  MyNotinoTests.swift
//  MyNotino
//
//  Created by Roman Podymov on 27/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import Fashion
@testable import MyNotinoApp
import Nimble
import Quick
import UIKit

class MyNotinoTests: QuickSpec {
    override func spec() {
        it("should resolve dependencies") {
            let dependencyInjectionContainer = DependencyInjectionContainer.shared
            expect(dependencyInjectionContainer.resolve(Stylesheet.self)).toNot(beNil())
            expect(dependencyInjectionContainer.resolve(RootScreen.self)).toNot(beNil())
            expect(dependencyInjectionContainer.resolve(ProductsDataProvider.self)).toNot(beNil())
            expect(dependencyInjectionContainer.resolve(ImagesProvider.self)).toNot(beNil())
        }

        it("configures views for auto layout") {
            let layout = UICollectionViewFlowLayout()
            let productsScreenGrid = UICollectionView(frame: .zero, collectionViewLayout: layout)
            productsScreenGrid.apply(
                styles: MyNotinoStyle.autolayoutView, MyNotinoStyle.productsScreenGridBase
            )
            expect(productsScreenGrid.translatesAutoresizingMaskIntoConstraints).to(beFalse())

            let productsScreenLoadingIndicator = UIActivityIndicatorView(
                frame: .zero,
                styles: MyNotinoStyle.productsScreenLoadingIndicator
            )
            expect(productsScreenLoadingIndicator.translatesAutoresizingMaskIntoConstraints).to(beFalse())

            let productsCell = ProductsCell(frame: .zero, styles: MyNotinoStyle.productsCell)
            expect(productsCell.translatesAutoresizingMaskIntoConstraints).to(beFalse())

            let productsCellImage = UIImageView(frame: .zero, styles: MyNotinoStyle.productsCellImage)
            expect(productsCellImage.translatesAutoresizingMaskIntoConstraints).to(beFalse())

            let productsCellLabel = UILabel(frame: .zero, styles: MyNotinoStyle.productsCellLabel)
            expect(productsCellLabel.translatesAutoresizingMaskIntoConstraints).to(beFalse())

            let productsCellButton = UIButton(frame: .zero, styles: MyNotinoStyle.productsCellButton)
            expect(productsCellButton.translatesAutoresizingMaskIntoConstraints).to(beFalse())
        }
    }
}
