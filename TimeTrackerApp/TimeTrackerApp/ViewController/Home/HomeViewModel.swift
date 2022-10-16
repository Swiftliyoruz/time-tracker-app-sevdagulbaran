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
    private weak var delegate: HomeViewModelDelegate?
    private let storeManager: DataManipulationInterface
    private var taskList: [Task] = []
    
    init (delegate: HomeViewModelDelegate, storeManager: DataManipulationInterface = DataManipulation()) {
        self.delegate = delegate
        self.storeManager = storeManager
    }
}

extension HomeViewModel: HomeViewModelInterface {
    var numberOfItemsInSection: Int {
        taskList.count
    }
    
    func viewDidLoad() {
        delegate?.setupUI()
        delegate?.tabbarConfig()
        delegate?.registerCollectionView()
    }
    func viewWillAppear() {
        taskList = storeManager.fetchTasks() ?? []
        delegate?.reloadData()
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
