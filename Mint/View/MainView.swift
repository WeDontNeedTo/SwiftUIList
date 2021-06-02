//
//  MainView.swift
//  Mint
//
//  Created by dmitry on 22.04.2021.
//

import SwiftUI
import FirebaseAuth
import Firebase


struct MainView: View {
    @State private var showingSheet = false
    @ObservedObject var tasks: TaskVM
    
    func isDoneFilter(by index: Int) -> Bool {
        tasks.taskListItems[index].isDone
    }
    
    func isDeleteFilter(by index: Int) -> Bool {
        tasks.taskListItems[index].isDeleted
    }
    
    func signOut(){
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
    var body: some View {
        VStack{
            NavigationView {
                Form {
                    Section(header: Text("To-do")) {
                        ForEach(0..<tasks.taskListItems.count, id: \.self) { index in
                            if !isDoneFilter(by: index) && !isDeleteFilter(by: index) {
                                TaskCardView(task: $tasks.taskListItems[index])
                                    .onChange(of: self.tasks.taskListItems[index]) { task in TaskVM.updateTask(task: task)}
                            }
                        }
                        .onDelete(perform: { indexSet in
                            let index = indexSet[indexSet.startIndex]
                            tasks.taskListItems[index].isDeleted.toggle()
                            TaskVM.updateTask(task: tasks.taskListItems[index])
                        })
                    }
                    Section(header: Text("Done")) {
                        ForEach(0..<tasks.taskListItems.count, id: \.self) { index in
                            if tasks.taskListItems[index].isDone && !tasks.taskListItems[index].isDeleted{
                                TaskCardView(task: $tasks.taskListItems[index])
                                    .onChange(of: self.tasks.taskListItems[index]) { task in TaskVM.updateTask(task: task)}
                            }
                        }
                        .onDelete(perform: { indexSet in
                            let index = indexSet[indexSet.startIndex]
                            tasks.taskListItems[index].isDeleted.toggle()
                            TaskVM.updateTask(task: tasks.taskListItems[index])
                        })
                    }
                }
                .navigationTitle("To-do")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button(action: {
                            signOut()
                        }) {
                            Text("Logout")
                        }
                    }
                    ToolbarItem(placement: .automatic){
                    Button(action: {
                        showingSheet.toggle()
                    }
                    ) {
                        Image(systemName:"plus")
                    }
                    }
                    
                }
            }
            .sheet(isPresented: $showingSheet) {
                AddTaskView(tasks: tasks)
                    .accentColor(.green)
                
            }
        }
        .onAppear {
            tasks.getTasks()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(tasks: TaskVM())
        }
    }
}
