//
//  ImagesProvider.swift
//  MyNotino
//
//  Created by Roman Podymov on 07/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import UIKit

protocol ImagesProvider {
    func set(url: String, to imageView: UIImageView)
}
