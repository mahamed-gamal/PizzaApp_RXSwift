//
//  AppDelegate.swift
//  PizzaApp
//
//  Created by Mohamed Gamal on 10/24/20.
//  Copyright © 2020 Me. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let initialViewController = CustomTabBarController()
        window = UIWindow()
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        return true
    }

}

