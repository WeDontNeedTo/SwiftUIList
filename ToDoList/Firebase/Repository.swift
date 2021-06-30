import Foundation
import FirebaseFirestore


class TaskRepository: ObservableObject{
    
    let db = Firestore.firestore()
    
    @Published var tasks = [ToDoElement]()
    
    func loadData() {
        db.collection("tasks").addSnapshotListener{ (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap{ document in
                  let x = try document.data(as: ToDoElement.self)
                    return x
                }
                catch{
                    print(error)
                }
                return nil
                
            }
        }
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    

