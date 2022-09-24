//
//  AddViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 13.09.2022.
//

import UIKit

final class AddViewController: UIViewController {
    
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var finishButton: UIButton!
    @IBOutlet private weak var quitButton: UIButton!
    @IBOutlet private weak var projectNameLabel: UILabel!
    @IBOutlet private weak var taskCategoryButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
// MARK: - Private Functions

private extension AddViewController {
    
     func setupUI(){
         finishButton.layer.masksToBounds = true
         finishButton.layer.cornerRadius = 8
         quitButton.layer.masksToBounds = true
         quitButton.layer.cornerRadius = 8
     }
}

// MARK: - Actions

extension AddViewController {
    
    @IBAction func finishButtonTapped(_ sender: Any) {
    }
    
    @IBAction func quitButtonTapped(_ sender: Any) {
    }
}
 
