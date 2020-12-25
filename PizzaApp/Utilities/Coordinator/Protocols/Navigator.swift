//
//  Navigator.swift
//  PizzaApp
//
//  Created by Mohamed Gamal on 12/21/20.
//  Copyright © 2020 Me. All rights reserved.
//

import Foundation
import UIKit

protocol Navigator {
    associatedtype Destination
    func viewController(for destination: Destination) -> UIViewController
    init(coordinator: Coordinator)
    var coorinator: Coordinator {get}
    func navigate(to destinatio: Destination)
}

extension Navigator {
    func navigate(to destination: Destination){
        let view = viewController(for: destination)
        coorinator.navigationController?.pushViewController(view, animated: true)
    }
}
