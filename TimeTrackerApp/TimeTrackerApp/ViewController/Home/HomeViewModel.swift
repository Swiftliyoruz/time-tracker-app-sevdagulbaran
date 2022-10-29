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
    func seeAllButtonTapped()
    func deleteCell(indexPath: IndexPath)
}

final class HomeViewModel {
    private weak var view: HomeViewInterface?
    private let storeManager: DataManipulationInterface
    var taskList: [Task] = []
    
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
        view?.moreButtonTapped()
    }
    
    func viewWillAppear() {
        taskList = storeManager.fetchTasks() ?? []
        view?.reloadData()
    }
    
    func cellForItem(indexPath: IndexPath) -> Task? {
        taskList.count > indexPath.row ? taskList[indexPath.row] : nil
    }
    
    func deleteCell(indexPath: IndexPath) {
        DataManipulation().deleteTask(task: self.taskList[indexPath.row])
        taskList.remove(at: indexPath.row)
    }
    
    func detailsButtonTapped() {
        print("tapped")
    }
    
    func seeAllButtonTapped() {
        print("tapped")
    }
}
