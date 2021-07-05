import Foundation
import SwiftUI
import FirebaseFirestore

struct ToDoElement: Hashable, Codable, Identifiable, Equatable {
    var id: Int
    var description: String
    var isDeleted: Bool
    var isArcheveted: Bool
}
