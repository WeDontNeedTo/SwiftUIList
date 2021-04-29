//
//  Task.swift
//  Mint
//
//  Created by dmitry on 23.04.2021.
//

import Foundation


struct Task: Identifiable, Codable {
    var id = UUID()
    var tasksText: String
    var isDone = false
    var isDeleted = false
}
