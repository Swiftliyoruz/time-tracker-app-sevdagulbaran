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
    @IBOutlet private weak var cellfirstCategoriyLabel: UILabel!
    @IBOutlet private weak var cellPalyButton: UIButton!
    @IBOutlet private weak var cellSecondCategoryLabel: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    func setCell() {
        cellTitleLabel?.text = "Project Title"
        cellTimeLAbel?.text = "23:08:12"
    }
    func setupUI(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 16
        cellfirstCategoriyLabel.layer.masksToBounds = true
        cellfirstCategoriyLabel.layer.cornerRadius = 3
    }
    
}
