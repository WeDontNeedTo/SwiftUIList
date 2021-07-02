import Foundation
import Combine

class TaskList: ObservableObject {
    @Published var toDoElements: [ToDoElement] = []
    @Published var taskRepository = TaskRepository()
    
    func addTask(task: ToDoElement){
            TaskRepository.shared.addTask(task: task)
        }
}
