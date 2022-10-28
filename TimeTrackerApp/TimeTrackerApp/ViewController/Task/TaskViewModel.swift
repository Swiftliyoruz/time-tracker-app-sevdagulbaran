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
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String
    func secondsToHoursMinutesSeconds(seconds: Int) -> ( Int, Int, Int )
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
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> ( Int, Int, Int ) {
        ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    func finishButtonTapped() {
      
    }
    
    func quitButtonTapped() {
        print("tapped")
    }
}
