//
//  ProductsCell.swift
//  MyNotino
//
//  Created by Roman Podymov on 06/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import Kingfisher
import PureLayout
import Reusable
import UIKit

struct ProductsCellData {
    let imageUrl: String?
    let brandName: String?
    let name: String?
    let annotation: String?
    let averageRating: Int
    let price: String?
}

final class ProductsCell: UICollectionViewCell, Reusable {
    private enum Constants {
        static let productImageViewHeight: CGFloat = 150
        static let favoriteProductButtonWidth: CGFloat = 40
        static let favoriteProductButtonHeight: CGFloat = 40
        static let additionalItemsContainerSpacing: CGFloat = 4
        static let additionalItemsContainerTopOffset: CGFloat = 160
        static let additionalItemsContainerLeftOffset: CGFloat = 20
        static let additionalItemsContainerRightOffset: CGFloat = 20
        static let addToCartButtonTopOffset: CGFloat = 20
    }

    private let productImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero, styles: MyNotinoStyle.productsCellImage)
        return imageView
    }()

    private let favoriteProductButton: FavoriteProductButton = {
        let button = FavoriteProductButton(frame: .zero)
        button.configureForAutoLayout()
        return button
    }()

    private let additionalItemsContainer: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = Constants.additionalItemsContainerSpacing
        stackView.axis = .vertical
        stackView.configureForAutoLayout()
        return stackView
    }()

    private let brandLabel: UILabel = {
        let label = UILabel(frame: .zero, styles: MyNotinoStyle.productsCellLabel)
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel(frame: .zero, styles: MyNotinoStyle.productsCellLabel)
        return label
    }()

    private let annotationLabel: UILabel = {
        let label = UILabel(frame: .zero, styles: MyNotinoStyle.productsCellLabel)
        return label
    }()

    private let ratingView: RatingView = {
        let ratingView = RatingView(frame: .zero)
        ratingView.configureForAutoLayout()
        ratingView.maxRating = 5
        return ratingView
    }()

    private let priceLabel: UILabel = {
        let label = UILabel(frame: .zero, styles: MyNotinoStyle.productsCellLabel)
        return label
    }()

    private let addToCartButton: UIButton = {
        let button = UIButton(frame: .zero, styles: MyNotinoStyle.productsCellButton)
        button.setTitleForAllStates(L10n.ProductsScreen.addToCart.uppercased())
        return button
    }()

    lazy var presenter = ProductsCellPresenter(view: self)

    override init(frame: CGRect) {
        super.init(frame: frame)

        apply(styles: MyNotinoStyle.autolayoutView, MyNotinoStyle.productsCellBase)

        setupProductImageView()
        setupFavoriteProductButton()
        setupAdditionalItemsContainer()
        setupItemsForAdditionalItemsContainer()
    }

    private func setupProductImageView() {
        contentView.addSubview(productImageView)
        productImageView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        productImageView.autoSetDimension(.height, toSize: Constants.productImageViewHeight)
    }

    private func setupFavoriteProductButton() {
        contentView.addSubview(favoriteProductButton)
        favoriteProductButton.autoPinEdge(.top, to: .top, of: productImageView)
        favoriteProductButton.autoSetDimension(.width, toSize: Constants.favoriteProductButtonWidth)
        favoriteProductButton.autoSetDimension(.height, toSize: Constants.favoriteProductButtonHeight)
    }

    private func setupAdditionalItemsContainer() {
        contentView.addSubview(additionalItemsContainer)
        additionalItemsContainer.autoPinEdge(
            toSuperviewEdge: .top,
            withInset: Constants.additionalItemsContainerTopOffset
        )
        additionalItemsContainer.autoPinEdge(
            toSuperviewEdge: .leading,
            withInset: Constants.additionalItemsContainerLeftOffset
        )
        additionalItemsContainer.autoPinEdge(
            toSuperviewEdge: .trailing,
            withInset: Constants.additionalItemsContainerRightOffset
        )
        additionalItemsContainer.autoPinEdge(
            .trailing,
            to: .trailing,
            of: favoriteProductButton
        )
    }

    private func setupItemsForAdditionalItemsContainer() {
        additionalItemsContainer.addArrangedSubviews([
            brandLabel,
            nameLabel,
            annotationLabel,
            ratingView,
            priceLabel,
            addToCartButton
        ])
        additionalItemsContainer.setCustomSpacing(Constants.addToCartButtonTopOffset, after: priceLabel)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        nil
    }
}

extension ProductsCell: ProductsCellView {
    func setup(_ data: ProductsCellData) {
        if let imageUrl = data.imageUrl {
            DependencyInjectionContainer.shared.resolve(
                ImagesProvider.self
            )?.set(
                url: imageUrl, to: productImageView
            )
        }
        brandLabel.text = data.brandName
        nameLabel.text = data.name
        annotationLabel.text = data.annotation
        ratingView.rating = data.averageRating
        priceLabel.text = data.price
    }
}
