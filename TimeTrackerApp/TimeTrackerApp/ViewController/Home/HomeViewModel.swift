//
//  HomeViewModel.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 24.09.2022.
//

import Foundation

protocol HomeViewModelInterface {
    var numberOfItemsInSection: Int { get }
    
    func cellForItem(indexPath: IndexPath) -> Task?
    func viewDidLoad()
    func viewWillAppear()
    func detailsButtonTapped()
    func moreButtonTapped()
    func seeAllButtonTapped()
}

final class HomeViewModel {
    private weak var view: HomeViewInterface?
    private let storeManager: DataManipulationInterface
    private var taskList: [Task] = []
    
    init (view: HomeViewInterface, storeManager: DataManipulationInterface = DataManipulation()) {
        self.view = view
        self.storeManager = storeManager
    }
}

extension HomeViewModel: HomeViewModelInterface {
    var numberOfItemsInSection: Int {
        taskList.count
    }
    
    func viewDidLoad() {
        view?.setupUI()
        view?.tabbarConfig()
        view?.registerCollectionView()
    }
    
    func viewWillAppear() {
        taskList = storeManager.fetchTasks() ?? []
        view?.reloadData()
    }
    
    func cellForItem(indexPath: IndexPath) -> Task? {
        // safe subscript array on swift
        // taskList[safe: indexPath.row]
        taskList.count > indexPath.row ? taskList[indexPath.row] : nil
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
