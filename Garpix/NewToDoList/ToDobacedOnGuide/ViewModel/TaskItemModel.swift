//
//  TaskItemModel.swift
//  ToDobacedOnGuide
//
//  Created by Владислав Положай on 05.07.2021.
//

import Foundation

class TaskItemModel: ObservableObject, Identifiable {
    @Published var toDoElements: [ToDoElement] = []
//    @Published var taskRepository = TaskRepository()
//    @Published var taskListSearch: [ToDoElement] = []
    func getTasks() {
        TaskRepository.shared.getTasks()
        { tasks in
            self.toDoElements = tasks
        }
    }
    
    func updateTask(task: ToDoElement){
        TaskRepository.shared.updateTask(task: task)
    }
    
    func addTask(task: ToDoElement){
        TaskRepository.shared.addTask(task: task)
    }
    
    func deleteTask(task: ToDoElement){
        TaskRepository.shared.deleteTask(task: task)
    }
}

