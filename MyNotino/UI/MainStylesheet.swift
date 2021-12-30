//
//  MainStylesheet.swift
//  MyNotino
//
//  Created by Roman Podymov on 06/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import Fashion
import PureLayout
import SwifterSwift
import UIKit

enum MyNotinoStyle: String {
    case autolayoutView
    case productsScreenGridBase
    case productsScreenLoadingIndicatorBase
    case productsCellBase
    case productsCellImageBase
    case productsCellLabelBase
    case productsCellButtonBase

    static let productsScreenGrid = [autolayoutView, productsScreenGridBase]
    static let productsScreenLoadingIndicator = [autolayoutView, productsScreenLoadingIndicatorBase]
    static let productsCell = [autolayoutView, productsCellBase]
    static let productsCellImage = [autolayoutView, productsCellImageBase]
    static let productsCellLabel = [autolayoutView, productsCellLabelBase]
    static let productsCellButton = [autolayoutView, productsCellButtonBase]
}

extension MyNotinoStyle: StringConvertible {
    public var string: String {
        rawValue
    }
}

final class MainStylesheet: Stylesheet {
    func define() {
        register(MyNotinoStyle.autolayoutView) { (view: UIView) in
            view.configureForAutoLayout()
        }

        register(MyNotinoStyle.productsScreenGridBase) { (collectionView: UIView) in
            collectionView.backgroundColor = .white
        }

        register(MyNotinoStyle.productsScreenLoadingIndicatorBase) { (indicatorView: UIActivityIndicatorView) in
            indicatorView.style = .gray
        }

        register(MyNotinoStyle.productsCellBase) { (cell: UIView) in
            cell.backgroundColor = .white
        }

        register(MyNotinoStyle.productsCellImageBase) { (imageView: UIView) in
            imageView.contentMode = .scaleAspectFit
        }

        register(MyNotinoStyle.productsCellLabelBase) { (label: UILabel) in
            label.textAlignment = .center
            label.numberOfLines = 0
            label.textColor = .black
        }

        register(MyNotinoStyle.productsCellButtonBase) { (button: UIButton) in
            button.setTitleColorForAllStates(.black)
            button.borderColor = .black
            button.borderWidth = 2
        }
    }
}
