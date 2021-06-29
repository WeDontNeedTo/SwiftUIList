//import Foundation
//import FirebaseFirestore
//import FirebaseAuth
//
//class TaskRepository {
//    static let shared = TaskRepository()
//    let db = Firestore.firestore()
//
//
//    func getTasks(_ onSuccess: @escaping([ToDoElement]) -> Void)  {
//        let user = Auth.auth().currentUser
//        var tasks = [ToDoElement]()
//        if let user = user{
//            db.collection("users").document(user.uid).collection("tasks").getDocuments { querySnapshot, error in
//                if let error = error {
//                    debugPrint("error", error)
//                }
//                if let querySnapshot = querySnapshot{
//                    tasks = querySnapshot.documents.compactMap { doc in
//                        do {
//                            let x = try doc.data(as: ToDoElement.self)
//                            return x
//                        }
//                        catch {
//                            print(error)
//                        }
//                        return nil
//                    }
//                    onSuccess(tasks)
//                }
//            }
//        }
//    }
//
//   
