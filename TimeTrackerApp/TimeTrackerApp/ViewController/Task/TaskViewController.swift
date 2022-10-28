//
//  TaskViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 13.09.2022.
//

import UIKit

protocol TaskViewInterface: AnyObject {
    func setupUI()
    func timerCounter()
    func timerStartUI()
    func timerFinishUI()
}

final class TaskViewController: UIViewController {
    
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var finishButton: UIButton!
    @IBOutlet private weak var quitButton: UIButton!
    @IBOutlet private weak var projectNameLabel: UILabel!
    @IBOutlet private weak var taskCategoryButton: UIBarButtonItem!
    
    private lazy var viewModel: TaskViewModelInterface = TaskViewModel()
    
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

// MARK: - Actions

extension TaskViewController {
    
    @IBAction func finishButtonTapped(_ sender: Any) {
        viewModel.finishButtonTapped()
    }
    
    @IBAction func quitButtonTapped(_ sender: Any) {
        viewModel.quitButtonTapped()
    }
}

// MARK: - TaskViewModelDelegate

extension TaskViewController: TaskViewInterface {
 
    @objc func timerCounter() {
        count += 1
        let time = viewModel.secondsToHoursMinutesSeconds(seconds: count)
        let timeString = viewModel.makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timeLabel.text = timeString
    }
    func timerStartUI() {
        finishButton.setTitle("START", for: .normal)
        finishButton.setTitleColor(UIColor.green, for: .normal)
    }
    
    func timerFinishUI() {
        finishButton.setTitle("STOP", for: .normal)
        finishButton.setTitleColor(UIColor.red, for: .normal)
    }

    func setupUI() {
        finishButton.layer.masksToBounds = true
        finishButton.layer.cornerRadius = 8
        quitButton.layer.masksToBounds = true
        quitButton.layer.cornerRadius = 8
    }
}
