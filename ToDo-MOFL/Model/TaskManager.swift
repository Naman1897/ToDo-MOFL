//
//  EventManager.swift
//  ToDo-MOFL
//
//  Created by Naman Singh on 04/06/22.
//

import Foundation
import CoreData
import UIKit

class TaskManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getLists(priority: PriorityEnum) -> [TaskList]{
        do {
            let fetchRequest: NSFetchRequest<TaskList>
            fetchRequest = TaskList.fetchRequest()

            fetchRequest.predicate = NSPredicate(
                format: "priorities = %@", "\(priority.rawValue)"
            )
            let newTaskData  = try context.fetch(fetchRequest)
            return newTaskData

        } catch {
            return []
        }
    }
    
    func createTask(name: String, details: String, priority: PriorityEnum){
        let newTask = TaskList(context: context)
        newTask.name = name
        newTask.date = Date()
        newTask.details = details
        newTask.priorities = priority.rawValue
        do {
            try context.save()
        } catch {
            
        }
    }
    
    func deleteTask(item: TaskList){
        context.delete(item)
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
    func updateTask(item: TaskList, newTitle: String, newDetail: String){
        item.name = newTitle
        item.details = newDetail
        do {
            try context.save()
        } catch {
            
        }
    }
}
