//
//  TaskViewModel.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 24.09.2022.
//

import Foundation

protocol TaskViewModelInterface {
    var view: TaskViewInterface? { get set}
    
    func viewDidLoad()
    func finishButtonTapped()
    func quitButtonTapped()
}

final class TaskViewModel {
    weak var view: TaskViewInterface?
     
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false

}

extension TaskViewModel: TaskViewModelInterface {
    func viewDidLoad() {
        view?.setupUI()
    }
    
    func finishButtonTapped() {
    
    }
    
    func quitButtonTapped() {
        print("tapped")
    }
}
