//
//  CustomTaskCollectionViewCell.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 6.09.2022.
//

import UIKit
import SwipeCellKit

protocol CustomTaskCellInterface: AnyObject {
    func setTaskTitle(taskTitleText: Task)
    func setMainCategory(mainCategoryText: Task)
    func setSubCategory(subCategoryText: Task)
    func setTaskIcon(taskIconImage: Task)
    func setupUI()
}
class CustomTaskCollectionViewCell: SwipeCollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var mainCategoryLabel: UILabel!
    @IBOutlet private weak var playButton: UIButton!
    @IBOutlet private weak var subCategoryLabel: UILabel!
    @IBOutlet private weak var mainCategoryView: UIView!
    @IBOutlet private weak var subCategoryView: UIView!
    @IBOutlet private weak var iconImageView: UIImageView!
    
    private lazy var viewModel: CustomTaskCellViewModelInterface = CustomTaskCellViewModel()
    
    var context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.view = self
        viewModel.awakeFromNib()
    }
}

// MARK: - Actions
extension CustomTaskCollectionViewCell {
    @IBAction func playButtonTapped(_ sender: Any) {
        viewModel.playButtonTapped()
    }
}

// MARK: - CustomTaskCellViewModelDelegate
extension CustomTaskCollectionViewCell: CustomTaskCellInterface {
    
    func setTaskTitle(taskTitleText: Task) {
        titleLabel.text = taskTitleText.taskTitle
    }
    
    func setMainCategory(mainCategoryText: Task) {
        mainCategoryLabel.text = mainCategoryText.mainCategory
    }
    
    func setSubCategory(subCategoryText: Task) {
        subCategoryLabel.text = subCategoryText.subCategory
    }
    
    func setTaskIcon(taskIconImage: Task) {
        guard let img = taskIconImage.taskIcon else { return }
        iconImageView.image =  UIImage(data: img)
    }
    
    func setupUI() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 16
        mainCategoryView.layer.cornerRadius = 6
        subCategoryView.layer.cornerRadius = 6
    }
}
