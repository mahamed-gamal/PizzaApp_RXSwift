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

    var coordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator = AppCoordinator()
        coordinator.start()
        return true
    }

}

