//
//  TaskRepository.swift
//  Mint
//
//  Created by dmitry on 27.05.2021.
//

import Foundation
import FirebaseFirestore

class TaskRepository {
    static let shared = TaskRepository()
    let db = Firestore.firestore()
    
    
    func getTasks(_ onSuccess: @escaping([Task]) -> Void)  {
        var tasks = [Task]()
        db.collection("tasks").getDocuments { querySnapshot, error in
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
    
    func updateTask(task: Task)  {
        if let id = task.id{
            let doc = db.collection("tasks").document(id)
            do{
                try doc.setData(from: task)
            }
            catch{
                print("Something wrong with update")
            }
        }
    }
    
    func addTask(task: Task)  {
        var ref: DocumentReference? = nil
        do{
        ref = try db.collection("tasks").addDocument(from: task) { err in
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
    
    func deleteTask(task: Task)  {
        if let id = task.id{
            db.collection("tasks").document(id).delete(){ err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
        }
    }
}
