//
//  ProductsScreenFooter.swift
//  MyNotino
//
//  Created by Roman Podymov on 08/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

#if SIMULATE_PAGINATION
import Fashion
import PureLayout
import Reusable
import UIKit

final class ProductsScreenFooter: UICollectionReusableView, Reusable {
    private let loadingIndicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(
            frame: .zero,
            styles: MyNotinoStyle.productsScreenLoadingIndicator
        )
        return indicatorView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(loadingIndicatorView)
        loadingIndicatorView.autoCenterInSuperview()
    }

    required init?(coder _: NSCoder) {
        nil
    }

    final func onLoadingStarted() {
        loadingIndicatorView.startAnimating()
    }

    final func onLoadingFinished() {
        loadingIndicatorView.stopAnimating()
    }
}
#endif
