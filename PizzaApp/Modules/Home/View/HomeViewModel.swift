//
//  HomeViewModel.swift
//  PizzaApp
//
//  Created by Mohamed Gamal on 12/12/20.
//  Copyright © 2020 Me. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel{
    private var sliderTimer: Timer?
    private let slides: BehaviorRelay<[Int]> = .init(value: [1,2,3,4,5])
    private var currentSlide = 0
    
    //MARK: - public Variables
    var numberOfItems: Int {
        return slides.value.count
    }
    
    //MARK: - Outputs
    var slideToItem: PublishSubject<Int>?
    
    //MARK: - Inputs
    func viewDidLoad(){
      sliderTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }
    
    @objc func scrollToNextItem() {
        let nextCount = currentSlide + 1
        currentSlide = nextCount % slides.value.count
        slideToItem?.onNext(currentSlide)
    }
}
