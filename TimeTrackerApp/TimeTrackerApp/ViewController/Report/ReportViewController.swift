//
//  ReportViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 13.09.2022.
//

import UIKit

final class ReportViewController: UIViewController {
    
    @IBOutlet private weak var completedView: UIView!
    @IBOutlet private weak var completedTimeLabel: UILabel!
    @IBOutlet private weak var completedLabel: UILabel!
    @IBOutlet private weak var timeDurationView: UIView!
    @IBOutlet private weak var timeDurationLabel: UILabel!
    @IBOutlet private weak var timeDurationHourLabel: UILabel!
    @IBOutlet private weak var dayWeekSegmented: UISegmentedControl!
    
    private lazy var viewModel: ReportViewModelInterface = ReportViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.viewDidLoad()
    }
}

// MARK: - ReportViewModelDelegate

extension ReportViewController: ReportViewModelDelegate {
      func setupUI() {
        completedView.layer.masksToBounds = true
        completedView.layer.cornerRadius = 8
        timeDurationView.layer.masksToBounds = true
        timeDurationView.layer.cornerRadius = 8
    }
}
