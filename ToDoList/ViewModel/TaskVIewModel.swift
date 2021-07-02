//import Foundation
//import Combine
//
//class TaskListViewModel: ObservableObject {
//
//  @Published var taskRepository = TaskRepository()
//
//    init() {
//        taskRepository.$tasks
//            .map { tasks in
//                tasks.map { task in
//                    TaskList(task: task)
//                }
//            }
//            .assign(to: \.TaskList, on self)
//            .self.todoElements.append()
//        }
//    
//}
