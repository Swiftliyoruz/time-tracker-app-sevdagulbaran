//
//  ReportViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 13.09.2022.
//

import UIKit

class ReportViewController: UIViewController {
    
    
    @IBOutlet private weak var completedView: UIView!
    @IBOutlet private weak var completedTimeLabel: UILabel!
    @IBOutlet private weak var completedLabel: UILabel!
    @IBOutlet private weak var timeDurationView: UIView!
    @IBOutlet private weak var timeDurationLabel: UILabel!
    @IBOutlet private weak var timeDurationHourLabel: UILabel!
    
    @IBOutlet private weak var dayWeekSegmented: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI(){
        completedView.layer.masksToBounds = true
        completedView.layer.cornerRadius = 8
        timeDurationView.layer.masksToBounds = true
        timeDurationView.layer.cornerRadius = 8
    }
}
