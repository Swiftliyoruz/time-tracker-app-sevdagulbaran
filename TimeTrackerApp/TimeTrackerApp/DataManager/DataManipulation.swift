//
//  DataManipulation.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 4.10.2022.
//

import UIKit
import CoreData

final class DataManipulation {
    
    static let shared = DataManipulation()
    
    static var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    private init(){
        
    }
     func createTask(task: Task) {
        do {
            try DataManipulation.context.save()
        }
        catch {
            print("Add Task Error")
        }
        print(task.self)
    }
    
    func fetchTasks() -> [Task]? {
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        
        do {
            let fetchedTask = try DataManipulation.context.fetch(fetchRequest) as! [Task]
            print(fetchedTask.count)
            
            return fetchedTask  
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        return nil
    }
    func updateTask(task: Task) {
        
    }
    
    func deleteTask(task: Task) {
        
    }
    
}
