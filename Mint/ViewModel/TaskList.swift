//
//  TaskList.swift
//  Mint
//
//  Created by dmitry on 23.04.2021.
//

import Foundation


class TaskList: ObservableObject {
    @Published var TaskListItems: [Task]{
        didSet{
            refresh()
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "SavedData") {
            if let decoded = try? JSONDecoder().decode([Task].self, from: data) {
                self.TaskListItems = decoded
                return
            }
        }
        self.TaskListItems=[]
    }
    
    private func save(){
        if let encoded = try? JSONEncoder().encode(TaskListItems){
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
    }
    
    func add(_ newTask: Task){
        self.TaskListItems.append(newTask)
        self.save()
    }
    
    func refresh(){
        self.save()
    }
}

