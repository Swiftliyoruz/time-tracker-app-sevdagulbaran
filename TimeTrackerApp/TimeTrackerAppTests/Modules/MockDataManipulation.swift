//
//  MockDataManipulation.swift
//  TimeTrackerAppTests
//
//  Created by Sevda Gul Baran on 15.10.2022.
//

import XCTest
@testable import TimeTrackerApp

final class MockDataManipulation: DataManipulationInterface {
    
    var invokedCreateTask =  false
    var invokedCreateTaskCount = 0
    
    func createTask(task: TimeTrackerApp.Task) {
        invokedCreateTask = true
        invokedCreateTaskCount += 1
    }
    
    var invokedFetchTasks =  false
    var invokedFetchTasksCount = 0
    
    func fetchTasks() -> [TimeTrackerApp.Task]? {
        invokedFetchTasks = true
        invokedFetchTasksCount += 1
        return []
    }
}
