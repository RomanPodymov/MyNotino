//
//  KFImagesProvider.swift
//  MyNotino
//
//  Created by Roman Podymov on 23/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import Kingfisher
import UIKit

struct KFImagesProvider {
    private let urlPrefix = "https://i.notino.com/detail_zoom/"
}

extension KFImagesProvider: ImagesProvider {
    func set(url: String, to imageView: UIImageView) {
        KF.url(URL(string: urlPrefix + url)).set(to: imageView)
    }
}
