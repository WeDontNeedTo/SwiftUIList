
import Foundation
import SwiftUI


struct ToDoElement: Hashable, Codable, Identifiable {
    var id: Int
    var isDone: Bool
    var description: String
    var isDeleted: Bool
    var isArchived: Bool
}

