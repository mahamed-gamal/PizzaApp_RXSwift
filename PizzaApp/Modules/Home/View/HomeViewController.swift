//
//  HomeViewController.swift
//  PizzaApp
//
//  Created by Mohamed Gamal on 10/24/20.
//  Copyright © 2020 Me. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    //MARK: - Properties
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCells()
        
    }
    
    private func setupUI() {
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
    }
    
    private func registerCells() {
        sliderCollectionView.registerCell(cellClass: SliderCell.self)
    }
}

//MARK: - Extension Slider Data Source
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as SliderCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    
}
