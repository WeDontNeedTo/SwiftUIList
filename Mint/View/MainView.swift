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
    
    var body: some View {
        VStack{
            NavigationView {
                Form {
                        Section(header: Text("To-do")) {
                            ForEach(0..<tasks.TaskListItems.count, id: \.self) { index in
                                if !tasks.TaskListItems[index].isDone && !tasks.TaskListItems[index].isDeleted{
                                    TaskCardView(task: $tasks.TaskListItems[index])
                                }
                            }
                            .onDelete(perform: { indexSet in
                                tasks.TaskListItems.remove(atOffsets: indexSet)
                            })
                        }
                        Section(header: Text("Done")) {
                            ForEach(0..<tasks.TaskListItems.count, id: \.self) { index in
                                if tasks.TaskListItems[index].isDone && !tasks.TaskListItems[index].isDeleted{
                                    TaskCardView(task: $tasks.TaskListItems[index])
                                }
                            }
                            .onDelete(perform: { indexSet in
                                let index = indexSet[indexSet.startIndex]
                                tasks.TaskListItems[index].isDeleted.toggle()
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
