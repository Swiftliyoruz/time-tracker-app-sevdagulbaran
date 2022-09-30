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
    private lazy var viewModel: CustomTaskCellViewModelInterface = CustomTaskCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewModel.delegate = self
        viewModel.viewDidLoad()
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
