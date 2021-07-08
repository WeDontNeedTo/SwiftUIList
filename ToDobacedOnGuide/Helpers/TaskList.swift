import Foundation

class TaskList: ObservableObject {
    @Published var toDoElements: [ToDoElement] = [] // load("toDoData.json")
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
