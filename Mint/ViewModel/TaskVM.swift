//
//  TaskList.swift
//  Mint
//
//  Created by dmitry on 23.04.2021.
//

import Foundation


class TaskVM: ObservableObject {
    @Published var taskListItems: [Task] = []
    @Published var taskListSearch: [Task] = []
    
    func getTasks() {
        TaskRepository.shared.getTasks { tasks in
            self.taskListItems = tasks
        }
    }
    
    static func updateTask(task: Task){
        TaskRepository.shared.updateTask(task: task)
    }
    
    static func addTask(task: Task){
        TaskRepository.shared.addTask(task: task)
    }
    
    static func deleteTask(task: Task){
        TaskRepository.shared.deleteTask(task: task)
    }
}

