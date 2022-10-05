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
    func reloadData()
}

protocol HomeViewModelInterface {
    var delegate: HomeViewModelDelegate? { get set}
    
    var numberOfItemsInSection: Int { get }
    var taskList: [Task] { get set }
    func viewDidLoad()
    func viewDidAppear()
    func detailsButtonTapped()
    func moreButtonTapped()
    func seeAllButtonTapped()
}



final class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
}

extension HomeViewModel: HomeViewModelInterface {
    var numberOfItemsInSection: Int {
        taskList.count
    }
    var taskList: [Task] {
           get {
               DataManipulation.shared.fetchTasks() ?? []
           }
           set {}
       }
    func viewDidLoad() {
        delegate?.setupUI()
        delegate?.tabbarConfig()
        delegate?.registerCollectionView()
        delegate?.reloadData()
    }
    func viewDidAppear() {
 
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
