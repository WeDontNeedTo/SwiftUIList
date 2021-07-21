
import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ToDoElement: Hashable, Codable, Identifiable {
    var id: String = UUID().uuidString
    var description: String
    var isDeleted: Bool
    var isArchived: Bool
}

