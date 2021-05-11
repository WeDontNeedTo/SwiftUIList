//
//  TaskList.swift
//  Mint
//
//  Created by dmitry on 23.04.2021.
//

import Foundation


class TaskList: ObservableObject {
    @Published var taskListItems: [Task]{
        didSet{
            save()
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Constants.todosKey) {
            if let decoded = try? JSONDecoder().decode([Task].self, from: data) {
                self.taskListItems = decoded
                return
            }
        }
        self.taskListItems=load("preloadedTasks.json")
    }
    
    func save(){
        if let encoded = try? JSONEncoder().encode(taskListItems){
            UserDefaults.standard.set(encoded, forKey: Constants.todosKey)
        }
    }
}

