import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift



class TaskRepository: ObservableObject{
    static let shared = TaskRepository()
    private let path: String = "tasks"
    
    let db = Firestore.firestore()
    
    @Published var tasks = [ToDoElement]()
    
    func loadData(_ onSuccess: @escaping([TaskList]) -> Void) {
        _ = [TaskList]()
        db.collection("tasks").addSnapshotListener{ (querySnapshot, error) in
            if let querySnapshot = querySnapshot{
                self.tasks = querySnapshot.documents.compactMap{ document in
                    try? document.data(as: ToDoElement.self)
                }
            }
        }
    }
    
    func addTask(task: ToDoElement)  {
                do{
                    let _ = try db.collection(path).addDocument(from: task)
                }
                catch{
                    fatalError("Unable to encode task: \(error.localizedDescription)" )
                }
            }
        
    func updateTask(task: ToDoElement)  {
        
//            if let id = task.id{
//                if let user = user{
//                    let doc = db.collection(path).document(user.uid).collection("tasks").document(id)
                    do{
                        let doc = db.collection(path).document()
                        try doc.setData(from: task)
                    }
                    catch{
                        print("Something wrong with update")
                    }
                }
    
    
    func deleteTask(task: ToDoElement)  {
            do{
                db.collection("tasks").document().delete() { err in
                        if let err = err {
                            print("Error removing document: \(err)")
                        } else {
                            print("Document successfully removed!")
                        }
                    }
                }
    }
    //    func add(_ task: Task) {
//        do {
//          _ = try store.collection(path).addDocument(from: task)
//        } catch {
//          fatalError("Unable to add card: \(error.localizedDescription).")
//        }
//      }
    
    
    
    
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    

