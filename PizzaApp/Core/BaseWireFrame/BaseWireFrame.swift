//
//  BaseWireFrame.swift
//  PizzaApp
//
//  Created by Mohamed Gamal on 12/25/20.
//  Copyright © 2020 Me. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class BaseWireFrame<T>: UIViewController {
    var viewModel: T
    let coodinator: Coordinator
    
    lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()
    
    init(viewModel: T, coordinator: Coordinator){
        self.viewModel = viewModel
        self.coodinator = coordinator
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(viewModel: T) {
        fatalError("please override bind function")
    }
}
