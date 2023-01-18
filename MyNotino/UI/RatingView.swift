//
//  RatingView.swift
//  MyNotino
//
//  Created by Roman Podymov on 06/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import NotinoAssets
import PureLayout
import UIKit

final class RatingView: UIView {
    private enum Constants {
        static let indicatorsContainerImageViewWidth: CGFloat = 20
        static let indicatorsContainerImageViewHeight: CGFloat = 20
    }

    private let indicatorsContainer: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.configureForAutoLayout()
        return stackView
    }()

    var maxRating = 5 {
        didSet {
            setupSubviews()
        }
    }

    var rating = 0 {
        didSet {
            setupSubviews()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(indicatorsContainer)
        indicatorsContainer.autoCenterInSuperview()
        indicatorsContainer.autoPinEdge(toSuperviewEdge: .top)
        indicatorsContainer.autoPinEdge(toSuperviewEdge: .bottom)

        setupSubviews()
    }

    required init?(coder _: NSCoder) {
        nil
    }

    private func setupSubviews() {
        indicatorsContainer.subviews.forEach {
            $0.removeFromSuperview()
        }
        let images = (0 ..< maxRating).map {
            $0 < rating ? NotinoAssets.icoStarPink : NotinoAssets.icoStarGrey
        }
        images.forEach {
            let imageView = UIImageView(image: $0)
            imageView.configureForAutoLayout()
            imageView.autoSetDimension(
                .width,
                toSize: Constants.indicatorsContainerImageViewWidth
            )
            imageView.autoSetDimension(
                .height,
                toSize: Constants.indicatorsContainerImageViewHeight
            )
            indicatorsContainer.addArrangedSubview(imageView)
        }
    }
}
