//
//  MainView.swift
//  Mint
//
//  Created by dmitry on 22.04.2021.
//

import SwiftUI


struct MainView: View {
    @State private var showingSheet = false
    @ObservedObject var tasks: TaskList

    func isDoneFilter(by index: Int) -> Bool {
        tasks.taskListItems[index].isDone
    }
    
    func isDeleteFilter(by index: Int) -> Bool {
        tasks.taskListItems[index].isDeleted
    }
    
    var body: some View {
        
        VStack{
            NavigationView {
                Form {
                        Section(header: Text("To-do")) {
                            ForEach(0..<tasks.taskListItems.count, id: \.self) { index in
                                if !isDoneFilter(by: index) && !isDeleteFilter(by: index) {
                                    TaskCardView(task: $tasks.taskListItems[index])
                                }
                            }
                            .onDelete(perform: { indexSet in
                                let index = indexSet[indexSet.startIndex]
                                tasks.taskListItems[index].isDeleted.toggle()
                            })
                        }
                        Section(header: Text("Done")) {
                            ForEach(0..<tasks.taskListItems.count, id: \.self) { index in
                                if tasks.taskListItems[index].isDone && !tasks.taskListItems[index].isDeleted{
                                    TaskCardView(task: $tasks.taskListItems[index])
                                }
                            }
                            .onDelete(perform: { indexSet in
                                let index = indexSet[indexSet.startIndex]
                                tasks.taskListItems[index].isDeleted.toggle()
                            })
                        }
                }
                .navigationTitle("To-do")
                .toolbar {
                    Button(action: {
                        showingSheet.toggle()
                    }
                        ) {
                            Image(systemName:"plus")
                        }
                    }
            }
            .sheet(isPresented: $showingSheet) {
                AddTaskView(tasks: tasks)
                    .accentColor(.green)
                
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(tasks: TaskList())
        }
    }
}
