//
//  TaskViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 13.09.2022.
//

import UIKit

final class TaskViewController: UIViewController {
    
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var finishButton: UIButton!
    @IBOutlet private weak var quitButton: UIButton!
    @IBOutlet private weak var projectNameLabel: UILabel!
    @IBOutlet private weak var taskCategoryButton: UIBarButtonItem!
    
    private lazy var viewModel: TaskViewModelInterface = TaskViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
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

extension TaskViewController: TaskViewModelDelegate {
    
    func setupUI(){
        finishButton.layer.masksToBounds = true
        finishButton.layer.cornerRadius = 8
        quitButton.layer.masksToBounds = true
        quitButton.layer.cornerRadius = 8
    }
}
