////
////  Repository.swift
////  ToDobacedOnGuide
////
////  Created by Артур Карачев on 01.07.2021.
////
//
//import Foundation
//import Firebase
//import FirebaseAuth
//import FirebaseFirestore
//
// class TaskRepository: ObservableObject {
//     let db = Firestore.firestore()
//
//     @Published var tasks = [TaskList]()
//
//     init() {
//         loadData()
//     }
//
//
//     func loadData() {
//         db.collection("tasks").addSnapshotListener(querySnapshot, error) in
//         if let querySnapshot = querySnapshot {
//             self.tasks = querySnapshot.documents.compactMap { document in
//                 do {
//                     let x = try document.data(as: Task.self)
//                     return x
//                 }
//                 catch{
//                     print(error)
//                 }
//                  return nil
//
//              }
//          }
//      }
//  }
