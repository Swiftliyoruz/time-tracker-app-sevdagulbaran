//
//  Task+CoreDataProperties.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 2.10.2022.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var mainCategory: String?
    @NSManaged public var taskIcon: Data?
    @NSManaged public var subCategory: String?
    @NSManaged public var taskDuration: Int64
    @NSManaged public var taskTitle: String?

}

extension Task : Identifiable {

}
