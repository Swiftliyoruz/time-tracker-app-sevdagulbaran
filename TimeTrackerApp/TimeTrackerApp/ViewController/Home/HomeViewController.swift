//
//  ViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 5.09.2022.
//

import UIKit
import CoreData
import SwipeCellKit

protocol HomeViewInterface: AnyObject {
    func tabbarConfig()
    func setupUI()
    func registerCollectionView()
    func reloadData()
    func moreButtonTapped()

}
private enum MoreButtonItem {
    static let delete = "Delete.."
    static let update = "Update.."
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
    @IBOutlet private weak var moreButton: UIBarButtonItem!
    
    private lazy var viewModel: HomeViewModelInterface = HomeViewModel(view: self)
    
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
        cell.delegate = self
        guard let task = viewModel.cellForItem(indexPath: indexPath) else { return cell }
        
        cell.setTaskTitle(taskTitleText: task)
        cell.setMainCategory(mainCategoryText: task)
        cell.setSubCategory(subCategoryText: task)
        cell.setTaskIcon(taskIconImage: task)
        
        return cell
    }
}

extension HomeViewController: SwipeCollectionViewCellDelegate {
    
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            self.viewModel.deleteCell(indexPath: indexPath)
            action.fulfill(with: .delete)
        }
        deleteAction.image = UIImage(named: "delete")
        return [deleteAction]
    }
    func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
}
// MARK: - HomeViewModelDelegate

extension HomeViewController: HomeViewInterface {
  
    func deleteCell(indexPath: IndexPath) {
        viewModel.deleteCell(indexPath: indexPath)
    }
    
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
    
    func moreButtonTapped() {
        var menuItems: [UIAction] {
            return [
                UIAction(title: MoreButtonItem.update, image: UIImage(systemName: "repeat"), handler: { (_) in }),
                UIAction(title: MoreButtonItem.delete, image: UIImage(systemName: "trash"), attributes: .destructive, handler: { (_) in })
            ]
        }
        var demoMenu: UIMenu {
            UIMenu(image: nil, identifier: nil, options: [], children: menuItems)
        }
        let moreButton =  UIBarButtonItem(image: UIImage(named: "more"), primaryAction: nil, menu: demoMenu)
        navigationItem.rightBarButtonItem = moreButton
        moreButton.tintColor = .blackBackground
    }
}
