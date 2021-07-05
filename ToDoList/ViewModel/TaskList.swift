import Foundation
import Combine

class TaskList: ObservableObject {
    @Published var toDoElements: [ToDoElement] = []
    @Published var taskRepository = TaskRepository()
//    private var cancellables: Set<AnyCancellable> = []
  
    func addTask(task: ToDoElement){
            TaskRepository.shared.addTask(task: task)
        }
    func getTasks() {
        TaskRepository.shared.getTasks { tasks in
               self.toDoElements = tasks
           }
       }
    func updateTask(task: ToDoElement){
            TaskRepository.shared.updateTask(task: task)
        }
    func deleteTask(task: ToDoElement){
            TaskRepository.shared.deleteTask(task: task)
        }
}
