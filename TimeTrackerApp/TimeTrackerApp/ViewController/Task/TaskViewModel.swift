//
//  TaskViewModel.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 24.09.2022.
//

import Foundation

protocol TaskViewModelInterface {
    var view: TaskViewInterface? { get set }
    
    func viewDidLoad()
    func actionButtonTapped()
    func quitButtonTapped()
}

final class TaskViewModel {
    weak var view: TaskViewInterface?
    
    var timer: Timer = Timer()
    var counter: Int = 0
    var isTimerCounting: Bool = false
}

// MARK: - Private Methods

extension TaskViewModel {
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
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
    
    @objc func timerCounter() {
        counter += 1
        let time = secondsToHoursMinutesSeconds(seconds: counter)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        view?.timePass(timeString: timeString)
    }
}

extension TaskViewModel: TaskViewModelInterface {
    
    func viewDidLoad() {
        view?.setupUI()
    }
    
    func actionButtonTapped() {
        if isTimerCounting {
            isTimerCounting = false
            timer.invalidate()
            view?.timerStartUI()
        } else {
            isTimerCounting = true
            view?.timerFinishUI()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    func quitButtonTapped() {
        print("tapped")
    }
}
