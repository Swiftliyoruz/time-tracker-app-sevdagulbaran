//
//  DataManipulation.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 4.10.2022.
//

import UIKit
import CoreData

protocol DataManipulationInterface {
    func createTask()
    func fetchTasks() -> [Task]?
}

final class DataManipulation: DataManipulationInterface {
   
     var context: NSManagedObjectContext? {
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        return context
    }
    
    init() {}
    
    func createTask() {
        do {
            try context?.save()
        } catch {
            print("Add Task Error")
        }
    }
    
    func fetchTasks() -> [Task]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        do {
            let fetchedTask = try context?.fetch(fetchRequest) as? [Task]
            return fetchedTask?.reversed()
        } catch {
            fatalError("Failed to fetch tasks: \(error)")
        }
    }
    
    func updateTask(task: Task) {
    }
    
    func deleteTask(task: Task) {
    }
}
