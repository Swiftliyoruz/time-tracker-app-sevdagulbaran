//
//  CustomTaskCollectionViewCell.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 6.09.2022.
//

import UIKit

class CustomTaskCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var cellTitleLabel: UILabel!
    @IBOutlet private weak var cellTimeLAbel: UILabel!
    @IBOutlet private weak var cellfirstCategoryLabel: UILabel!
    @IBOutlet private weak var cellPalyButton: UIButton!
    @IBOutlet private weak var cellSecondCategoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}


private extension CustomTaskCollectionViewCell {
    
    func setupUI() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 16
    }
}
