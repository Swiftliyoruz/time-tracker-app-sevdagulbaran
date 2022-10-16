//
//  CustomTaskCollectionViewCell.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 6.09.2022.
//

import UIKit

class CustomTaskCollectionViewCell: UICollectionViewCell {
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
 //fix
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.delegate = self
        viewModel.viewDidLoad()
    }
    //fix
    func configureCell(task: Task) {
        titleLabel.text = task.taskTitle
        mainCategoryLabel.text = task.mainCategory
        subCategoryLabel.text = task.subCategory
        //vm
        guard let img = task.taskIcon else { return }
        iconImageView.image =  UIImage(data: img)
    }
}

// MARK: - Actions
extension CustomTaskCollectionViewCell {
    @IBAction func playButtonTapped(_ sender: Any) {
        viewModel.playButtonTapped()
    }
}

// MARK: - CustomTaskCellViewModelDelegate

extension CustomTaskCollectionViewCell: CustomTaskCellViewModelDelegate {
    func setupUI() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 16
        mainCategoryView.layer.cornerRadius = 6
        subCategoryView.layer.cornerRadius = 6
    }
}
