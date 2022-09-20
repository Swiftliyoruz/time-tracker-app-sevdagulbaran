//
//  ViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 5.09.2022.
//

import UIKit

enum Constant {
    static let tableViewData = 5
    static let cellSpacingHeight: CGFloat = 16.0
    static let cellNibName = "CustomTaskCollectionViewCell"
    static let cellReusIdentifier = "CustomTaskCollectionViewCell"
    
}
class ViewController: UIViewController {
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var detailsButton: UIButton!
    @IBOutlet private weak var workLabel: UIView!
    @IBOutlet private weak var seeAllLabel: UILabel!
    @IBOutlet private weak var taskCollectionView: UICollectionView!
    @IBOutlet private weak var todayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionView()
        tabbarConfig()
        setupUI()
    }
    
    func tabbarConfig(){
        guard let tabbar = self.tabBarController?.tabBar else { return }
        tabbar.tintColor = .blackBackground
        tabbar.unselectedItemTintColor = .lightBackground
        tabbar.layer.cornerRadius = 30
    }
    func setupUI(){
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 16
        cardView.layer.borderWidth = 0.3
    }
    func registerCollectionView(){
        taskCollectionView.delegate = self
        taskCollectionView.dataSource = self
        taskCollectionView.register(UINib(nibName: Constant.cellNibName, bundle: nil),forCellWithReuseIdentifier: Constant.cellReusIdentifier)
       // taskCollectionView.register(Constant.cellNibName, forCellWithReuseIdentifier: Constant.cellReusIdentifier)
        
    }
    @IBAction func detailsButtonTapped(_ sender: Any) {
    }
    
    @IBAction func moreButtonTapped(_ sender: Any) {
    }
}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Constant.tableViewData
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = taskCollectionView.dequeueReusableCell(withReuseIdentifier: Constant.cellReusIdentifier, for: indexPath) as! CustomTaskCollectionViewCell
        cell.setCell()
        return cell
    }
}


