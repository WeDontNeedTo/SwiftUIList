import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ToDoElement: Hashable, Codable, Identifiable, Equatable{
//    var id: String? = UUID().uuidString
    @DocumentID var id: String?
    var description: String
    var isDeleted: Bool
    var isArcheveted: Bool
}
