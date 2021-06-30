
import Foundation
import Firebase

class TaskViewModel: ObservableObject {
  @Published var taskRepository = TaskRepository()
  @Published var taskVIewModel : [ToDoElement] = []
    
//    private var db = Firestore.firestore()
//
////    func addTask(taskViewModel: ToDoElement){
////        do{
////            let _ = try db.collection("tasks").addDocument(data : taskVIewModel)
////        }
////        catch{
////            print(error)
//        }
//    }
}
