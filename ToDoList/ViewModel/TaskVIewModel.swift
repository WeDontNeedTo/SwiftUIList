import Combine

class TaskListViewModel: ObservableObject {

  @Published var taskRepository = TaskRepository()

  
  func add(_ task: ToDoElement) {
    taskRepository.add(task)
  }
}
