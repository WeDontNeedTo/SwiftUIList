//
//  TaskRepository.swift
//  Mint
//
//  Created by dmitry on 27.05.2021.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class TaskRepository {
    static let shared = TaskRepository()
    let db = Firestore.firestore()
    
    
    func getTasks(_ onSuccess: @escaping([Task]) -> Void)  {
        let user = Auth.auth().currentUser
        var tasks = [Task]()
        if let user = user{
            db.collection("users").document(user.uid).collection("tasks").getDocuments { querySnapshot, error in
                if let error = error {
                    debugPrint("error", error)
                }
                if let querySnapshot = querySnapshot{
                    tasks = querySnapshot.documents.compactMap { doc in
                        do {
                            let x = try doc.data(as: Task.self)
                            return x
                        }
                        catch {
                            print(error)
                        }
                        return nil
                    }
                    onSuccess(tasks)
                }
            }
        }
    }
    
    func updateTask(task: Task)  {
        let user = Auth.auth().currentUser
        if let id = task.id{
            if let user = user{
                let doc = db.collection("users").document(user.uid).collection("tasks").document(id)
                do{
                    try doc.setData(from: task)
                }
                catch{
                    print("Something wrong with update")
                }
            }
        }
    }
    
    func addTask(task: Task)  {
        let user = Auth.auth().currentUser
        var ref: DocumentReference? = nil
        if let user = user{
            do{
                ref = try db.collection("users").document(user.uid).collection("tasks").addDocument(from: task) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
            }
            catch{
                print("Something wrong with adding")
            }
        }
    }
    
    func deleteTask(task: Task)  {
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
