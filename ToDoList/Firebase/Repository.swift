import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class TaskRepository: ObservableObject{
    
    static let shared = TaskRepository()
    private let path: String = "tasks"
    let db = Firestore.firestore()
    @Published var tasks = [ToDoElement]()
    

    func getTasks(_ onSuccess: @escaping([ToDoElement]) -> Void) {
        _ = [TaskList]()
        
            db.collection("tasks").addSnapshotListener{ (querySnapshot, error) in
                if let querySnapshot = querySnapshot{
                    self.tasks = querySnapshot.documents.compactMap{ document in
                        do{
                            let x = try document.data(as: ToDoElement.self)
                            return x
                        }
                        catch{
                            print(error)
                        }
                        return nil
                    }
                    onSuccess(self.tasks)
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
           let user = Auth.auth().currentUser
           if let id = task.id{
               if let user = user{
                   let doc = db.collection("tasks").document(user.uid).collection("tasks").document(id)
                   do{
                       try doc.setData(from: task)
                   }
                   catch{
                       print("Something wrong with update")
                   }
               }
           }
       }

    func deleteTask(task: ToDoElement)  {
            let user = Auth.auth().currentUser
            if let id = task.id{
                if let user = user{
                    db.collection("users").document(user.uid).collection("tasks").document(id).delete(){ err in
                        if let err = err {
                            print("Error removing document: \(err)")
                        } else {
                            print("Document successfully removed!")
                        }
                    }
                }
            }
        }
    }
