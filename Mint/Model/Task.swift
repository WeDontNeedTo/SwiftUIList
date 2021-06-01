//
//  Task.swift
//  Mint
//
//  Created by dmitry on 23.04.2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


struct Task: Identifiable, Codable, Equatable {
    @DocumentID var id: String?
    var tasksText: String
    var isDone = false
    var isDeleted = false
}
