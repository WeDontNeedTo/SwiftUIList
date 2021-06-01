import Foundation
import SwiftUI
import Combine

struct ToDoElement: Hashable, Codable, Identifiable {
    var id: Int
    var isDone: Bool
    var description: String
}
