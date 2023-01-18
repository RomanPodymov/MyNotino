//
//  AppDelegate.swift
//  MyNotino
//
//  Created by Roman Podymov on 06/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import Fashion
import Swinject
import UIKit

protocol RootScreen: UIViewController {}

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        Fashion.register(
            stylesheets: [
                DependencyInjectionContainer.shared.resolve(Stylesheet.self)!
            ]
        )
        setupWindow()
        return true
    }

    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = DependencyInjectionContainer.shared.resolve(RootScreen.self)
        window?.makeKeyAndVisible()
    }
}
