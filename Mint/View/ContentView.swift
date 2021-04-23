//
//  ContentView.swift
//  Mint
//
//  Created by dmitry on 22.04.2021.
//

import SwiftUI


struct ContentView: View {
    @State private var showingSheet = false
    @ObservedObject var tasks = TaskList()
    

    var body: some View {
        VStack{
            NavigationView {
                List{
                    ForEach(tasks.TaskListItems) { task in
                        TaskCardView(task: task)
                    }
                }
                .navigationTitle("To-do")
                .toolbar {
                    Button(action: {
                        showingSheet.toggle()
                    }
                        ) {
                            Image(systemName:"plus")
    //                            .renderingMode(.original)
                                .foregroundColor(Color.green)
                        }
    //                    .buttonStyle(PlainButtonStyle())
                    }
            }
            .sheet(isPresented: $showingSheet) {
                AddTaskView(tasks: tasks)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
