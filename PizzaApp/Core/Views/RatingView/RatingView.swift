//
//  RatingView.swift
//  PizzaApp
//
//  Created by Mohamed Gamal on 10/26/20.
//  Copyright © 2020 Me. All rights reserved.
//

import Foundation
import UIKit

class RatingView: UIView{
    
    enum StarType {
        case filled
        case nonFilled
    }
    private let maximumRating = 5
    var rating: Int = 5
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        configureRatingView(rating: 3)
    }
    
    func setupUI() {
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func configureRatingView(rating: Int) {
        // add filled star
        if rating > 0 {
            for _ in 1...rating {
                let image = generateStarView(.filled)
                stackView.addArrangedSubview(image)
            }
        }
        
        //add non filled star
        let nonFilledCount = maximumRating - rating
        if nonFilledCount > 0 {
            for _ in 1...nonFilledCount {
                let image = generateStarView(.nonFilled)
                stackView.addArrangedSubview(image)
            }
        }
    }
    
    private func generateStarView(_ type: StarType) -> UIImageView {
        let starImage: UIImage
        switch type {
        case .filled:
            starImage = #imageLiteral(resourceName: "filled_star")
        case .nonFilled:
            starImage = #imageLiteral(resourceName: "star")
        }
        let image = UIImageView(image: starImage)
        image.contentMode = .scaleAspectFit
        image.widthAnchor.constraint(lessThanOrEqualToConstant: 10).isActive = true
        return image
    }
}
