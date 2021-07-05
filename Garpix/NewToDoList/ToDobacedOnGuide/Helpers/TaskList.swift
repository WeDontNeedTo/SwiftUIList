//
//import Foundation
//class TaskList : ObservableObject {
//    @Published var toDoElements = [ToDoElement]()
//    @Published var taskRepository = TaskRepository()
//
//    init(){
//        taskRepository.$tasks
//            .map { task in
//            ToDoElement(tasks: tasks)
//        }
//    }
//}
