////
////  TaskListModel.swift
////  ToDobacedOnGuide
////
////  Created by Владислав Положай on 05.07.2021.
////
//
//import Foundation
//
//class TaskListModel: ObservableObject {
//    @Published var toDoElements: [ToDoElement] = []
//
//    func getTasks() {
//        TaskRepository.shared.getTasks { tasks in
//            self.toDoElements = tasks
//
//        }
//    }
//
//    static func updateTask(task: ToDoElement){
//        TaskRepository.shared.updateTask(task: task)
//        print("SMTH SMTH")
//    }
//}
