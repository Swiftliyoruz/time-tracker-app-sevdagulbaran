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
    @IBOutlet private weak var firstCategoryLabel: UILabel!
    @IBOutlet private weak var playButton: UIButton!
    @IBOutlet private weak var secondCategoryLabel: UILabel!
    
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
    }
    
}
