
import Foundation
class TaskList : ObservableObject {
    @Published var toDoElements : [ToDoElement] = load("tasksData.json")
}
