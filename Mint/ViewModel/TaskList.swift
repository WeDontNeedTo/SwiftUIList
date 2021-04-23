//
//  TaskList.swift
//  Mint
//
//  Created by dmitry on 23.04.2021.
//

import Foundation


class TaskList: ObservableObject {
    @Published var TaskListItems = [
        Task(tasksText: "Create first app"),
        Task(tasksText: "Create second app"),
        Task(tasksText: "Create third app")
      ]
}
