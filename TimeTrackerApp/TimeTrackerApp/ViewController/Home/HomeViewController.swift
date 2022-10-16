//
//  ViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 5.09.2022.
//

import UIKit
import CoreData

protocol HomeViewModelDelegate: AnyObject {
    func tabbarConfig()
    func setupUI()
    func registerCollectionView()
    func reloadData()
}

final class HomeViewController: UIViewController {
    
    private enum Constant {
        static let cellNibName = "CustomTaskCollectionViewCell"
        static let cellReusIdentifier = "CustomTaskCollectionViewCell"
    }
    
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var detailsButton: UIButton!
    @IBOutlet private weak var workLabel: UIView!
    @IBOutlet private weak var seeAllButton: UIButton!
    @IBOutlet private weak var taskCollectionView: UICollectionView!
    @IBOutlet private weak var todayLabel: UILabel!
    
    private lazy var viewModel: HomeViewModelInterface = HomeViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewWillAppear()
    }
}
// MARK: - Actions

extension HomeViewController {
    
    @IBAction func detailsButtonTapped(_ sender: Any) {
        viewModel.detailsButtonTapped()
    }
    @IBAction func moreButtonTapped(_ sender: Any) {
        viewModel.moreButtonTapped()
    }
    @IBAction func seeAllButtonTapped(_ sender: Any) {
        viewModel.seeAllButtonTapped()
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = taskCollectionView.dequeueReusableCell(withReuseIdentifier: Constant.cellReusIdentifier, for: indexPath) as? CustomTaskCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let task = viewModel.cellForItem(indexPath: indexPath) else { return cell }
        cell.configureCell(task: task)
        return cell
    }
}
// MARK: - HomeViewModelDelegate

extension HomeViewController: HomeViewModelDelegate {
    func reloadData() {
        taskCollectionView.reloadData()
    }
    func setupUI() {
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 16
        cardView.layer.borderWidth = 0.3
    }
    func tabbarConfig() {
        tabBarController?.tabBar.tintColor = .blackBackground
        tabBarController?.tabBar.layer.cornerRadius = 30
    }
    func registerCollectionView() {
        let nib = UINib(nibName: Constant.cellNibName, bundle: nil)
        taskCollectionView.register(nib, forCellWithReuseIdentifier: Constant.cellReusIdentifier)
    }
}
