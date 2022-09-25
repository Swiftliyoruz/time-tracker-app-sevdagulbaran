//
//  TaskViewModel.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 24.09.2022.
//

import Foundation


protocol TaskViewModelDelegate: AnyObject {
    func setupUI()
}

protocol TaskViewModelInterface {
    var delegate: TaskViewModelDelegate? { get set}
    
    func viewDidLoad()
    func finishButtonTapped()
    func quitButtonTapped()
}

final class TaskViewModel {
    weak var delegate: TaskViewModelDelegate?
}

extension TaskViewModel: TaskViewModelInterface {
    func viewDidLoad() {
        delegate?.setupUI()
    }
    
    func finishButtonTapped() {
        print("tapped")
    }
    
    func quitButtonTapped() {
        print("tapped")
    }
}
