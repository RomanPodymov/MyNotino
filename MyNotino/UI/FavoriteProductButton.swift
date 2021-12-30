//
//  FavoriteProductButton.swift
//  MyNotino
//
//  Created by Roman Podymov on 06/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import UIKit

final class FavoriteProductButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setImage(Asset.heart.image, for: .normal)
        setImage(Asset.heartBold.image, for: .selected)

        addTarget(self, action: #selector(primaryActionTriggered), for: .primaryActionTriggered)
    }

    required init?(coder _: NSCoder) {
        nil
    }

    @objc private func primaryActionTriggered() {
        isSelected = !isSelected
    }
}
