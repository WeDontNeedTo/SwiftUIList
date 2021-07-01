import Foundation
import SwiftUI

struct ToDoElement: Hashable, Codable, Identifiable {
    var id: Int
    //var id: String? = UUID().uuidString
    var description: String
    var isDeleted: Bool
    var isArcheveted: Bool
}
