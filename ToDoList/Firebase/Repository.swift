import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift



class TaskRepository: ObservableObject{
    
    private let path: String = "tasks"
    
    private let store = Firestore.firestore()
    
    func add(_ task: ToDoElement) {
        do {
          _ = try store.collection(path).addDocument(from: task)
        } catch {
          fatalError("Unable to add card: \(error.localizedDescription).")
        }
      }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    @Published var tasks = [ToDoElement]()
    
//    func loadData() {
//        db.collection("tasks").addSnapshotListener{ (querySnapshot, error) in
//            if let querySnapshot = querySnapshot {
//                self.tasks = querySnapshot.documents.compactMap{ document in
//                  let x = try document.data(as: ToDoElement.self)
//                    return x
//                }
//                catch{
//                    print(error)
//                }
//                return nil
//
//            }
//        }
//    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    

