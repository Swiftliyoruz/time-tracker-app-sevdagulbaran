//
//  TaskViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 13.09.2022.
//

import UIKit

protocol TaskViewInterface: AnyObject {
    func setupUI()
    func timerStartUI()
    func timerFinishUI()
    func timePass(timeString: String)
}

final class TaskViewController: UIViewController {
    
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var finishButton: UIButton!
    @IBOutlet private weak var quitButton: UIButton!
    @IBOutlet private weak var projectNameLabel: UILabel!
    @IBOutlet private weak var taskCategoryButton: UIBarButtonItem!
    
    private lazy var viewModel: TaskViewModelInterface = TaskViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

// MARK: - Actions

extension TaskViewController {
    
    @IBAction func actionButtonTapped(_ sender: Any) {
        viewModel.actionButtonTapped()
    }
    
    @IBAction func quitButtonTapped(_ sender: Any) {
        viewModel.quitButtonTapped()
    }
}

// MARK: - TaskViewInterface

extension TaskViewController: TaskViewInterface {
    
    func timePass(timeString: String) {
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
