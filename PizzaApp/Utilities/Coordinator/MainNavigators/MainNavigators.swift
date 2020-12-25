//
//  MainNavigators.swift
//  PizzaApp
//
//  Created by Mohamed Gamal on 12/21/20.
//  Copyright © 2020 Me. All rights reserved.
//

import Foundation
import UIKit

class MainNavigators: Navigator {
    var coorinator: Coordinator
    required init(coordinator: Coordinator) {
        self.coorinator = coordinator
    }
    
    enum Destination {
        case home
    }
    
    func viewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .home:
            let viewModel = HomeViewModel()
            return HomeViewController(viewModel: viewModel, coordinator: coorinator)
        }
    }
}

