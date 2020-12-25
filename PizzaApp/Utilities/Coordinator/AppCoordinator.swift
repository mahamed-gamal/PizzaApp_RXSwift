//
//  AppCoordinator.swift
//  PizzaApp
//
//  Created by Mohamed Gamal on 12/21/20.
//  Copyright © 2020 Me. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var Main: MainNavigators {get}
    var navigationController: UINavigationController? {get}
}

class AppCoordinator: Coordinator {
    var window: UIWindow
    
    private lazy var tabBar: CustomTabBarController = {
       return CustomTabBarController(coordinator: self)
    }()
    
    var navigationController: UINavigationController? {
        if let navigationController = tabBar.selectedViewController as? UINavigationController {
            return navigationController
        }
        return nil
    }
    
    lazy var Main: MainNavigators = {
        return .init(coordinator: self)
    }()
    
    init(window: UIWindow = UIWindow()) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    var rootViewController: UIViewController {
        return tabBar
    }
}
