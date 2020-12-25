//
//  HomeViewController.swift
//  PizzaApp
//
//  Created by Mohamed Gamal on 10/24/20.
//  Copyright © 2020 Me. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: BaseWireFrame<HomeViewModel> {
    //MARK: - Outlets
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var popularTableView: UITableView!
    //MARK: - Properties
    //let viewModel = HomeViewModel()
    //let disposeBag = DisposeBag()
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPopularTableView()
        registerCells()
        popularTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        viewModel.viewDidLoad()
    }
    
    override func bind(viewModel: HomeViewModel) {
        viewModel.slideToItem?.subscribe(onNext: { [weak self] (index) in
        self?.sliderCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
        }).disposed(by: disposeBag)
    }
    
    private func setupUI() {
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
    }
    
    private func setupPopularTableView() {
        popularTableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel.productItems.asObservable().bind(to: popularTableView.rx.items(cellIdentifier: String(describing: PopularCell.self), cellType: PopularCell.self)){ index, model, cell in
            
            
        }.disposed(by: disposeBag)
        
    }
    
    private func registerCells() {
        sliderCollectionView.registerCell(cellClass: SliderCell.self)
        popularTableView.registerCellNib(cellClass: PopularCell.self)
    }
}

//MARK: - Extension Slider Data Source
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as SliderCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    
}
