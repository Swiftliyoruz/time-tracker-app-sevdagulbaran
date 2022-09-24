//
//  HomeViewModel.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 24.09.2022.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func tabbarConfig()
    func setupUI()
    func registerCollectionView()
}

protocol HomeViewModelInterface {
    var delegate: HomeViewModelDelegate? { get set}
    
    var numberOfItemsInSection: Int { get }
    
    func viewDidLoad()
    func detailsButtonTapped()
    func moreButtonTapped()
    func seeAllButtonTapped()
}

private extension HomeViewModel {
    enum Constant {
        static let tableViewData = 5
    }
}

final class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
}

extension HomeViewModel: HomeViewModelInterface {
    var numberOfItemsInSection: Int {
        Constant.tableViewData
    }
    
    func viewDidLoad() {
        delegate?.setupUI()
        delegate?.tabbarConfig()
        delegate?.registerCollectionView()
    }
    
    func detailsButtonTapped() {
        print("tapped")
    }
    
    func moreButtonTapped() {
        print("tapped")
    }
    
    func seeAllButtonTapped() {
        print("tapped")
    }
}
