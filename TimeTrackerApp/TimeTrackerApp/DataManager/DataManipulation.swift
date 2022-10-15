//
//  DataManipulation.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 4.10.2022.
//

import UIKit
import CoreData


protocol DataManipulationInterface {
    func createTask(task: Task)
    func fetchTasks() -> [Task]?
}


final class DataManipulation: DataManipulationInterface {
   
    static let shared = DataManipulation()
    
    static var context: NSManagedObjectContext? {
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        return context
    }
    
    private init() {}
    
    func createTask(task: Task) {
        do {
            try DataManipulation.context?.save()
        } catch {
            print("Add Task Error")
        }
    }
    
    func fetchTasks() -> [Task]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        do {
            let fetchedTask = try DataManipulation.context?.fetch(fetchRequest) as? [Task]
            return fetchedTask?.reversed()
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
    
    func updateTask(task: Task) {
    }
    
    func deleteTask(task: Task) {
    }
}
