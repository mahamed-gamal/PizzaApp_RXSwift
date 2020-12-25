//
//  CustomTabBarController.swift
//  PizzaApp
//
//  Created by Mohamed Gamal on 12/18/20.
//  Copyright © 2020 Me. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    enum TabBarItems:Int, CaseIterable {
        case Home
        case PizzaMaker
        case Cart
    }
    
    lazy var middleButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .pinkishRed
        button.setImage(#imageLiteral(resourceName: "pizza_tab_bar"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(CustomTabBar(), forKey: "tabBar")
        setupTabBarItems()
        setupTabBarUI()
        createMiddleButton()
    }
    
    private func createMiddleButton() {
        self.tabBar.addSubview(middleButton)
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleButton.widthAnchor.constraint(equalToConstant: 50),
            middleButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        middleButton.layer.cornerRadius = 25
    }
    
    private func setupTabBarUI() {
        tabBar.tintColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        tabBar.unselectedItemTintColor = .red
        tabBar.items?[TabBarItems.PizzaMaker.rawValue].isEnabled = false
        middleButton.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
    }
    
    @objc func didPressMiddleButton() {
        print("pressed middle button")
    }
    
    private func setupTabBarItems() {
        self.viewControllers = TabBarItems.allCases.map({
            let view = viewControllerForTabBar(_item: $0)
            let navigation = UINavigationController(rootViewController: view)
            navigation.navigationBar.barTintColor = UIColor.darkBlueGrey
            return navigation})
    }
    
    func viewControllerForTabBar(_item: TabBarItems) -> UIViewController {
        switch _item {
        case .Home:
             let view = coordinator.Main.viewController(for: .home)
            view.tabBarItem = tabBarItem(for: .Home)
            return view
        case .PizzaMaker:
            let view = UIViewController()
            view.tabBarItem = tabBarItem(for: .PizzaMaker)
            return view
        case .Cart:
            let view = coordinator.Main.viewController(for: .home)
            view.tabBarItem = tabBarItem(for: .Cart)
            return view
        }
    }
    
    private func tabBarItem(for item: TabBarItems) -> UITabBarItem?{
        let tabBarItem: UITabBarItem
        switch item {
        case .Home:
            tabBarItem = .init(title: "Home", image: #imageLiteral(resourceName: "home_tab_bar"), selectedImage: #imageLiteral(resourceName: "home_tab_bar"))
        case .PizzaMaker:
           return nil
        case .Cart:
           tabBarItem = .init(title: "Cart", image: #imageLiteral(resourceName: "cart_tab_bar"), selectedImage: #imageLiteral(resourceName: "cart_tab_bar"))
        }
        tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 15)
        tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: -10, right: 0)
        
        return tabBarItem
    }

}
