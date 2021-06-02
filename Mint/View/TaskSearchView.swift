//
//  TaskSearchView.swift
//  Mint
//
//  Created by dmitry on 02.06.2021.
//

import SwiftUI

struct TaskSearchView: View {
    @State var searchText: String = ""
    @ObservedObject var tasks: TaskVM
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText)
            }.padding()
            Form {
                ForEach(0..<tasks.taskListItems.count, id: \.self) { index in
                    if tasks.taskListItems[index].tasksText.contains(searchText){
                        TaskCardView(task: $tasks.taskListItems[index])
                            .onChange(of: self.tasks.taskListItems[index]) { task in TaskVM.updateTask(task: task)}
                    }
                }
                .onDelete(perform: { indexSet in
                    let index = indexSet[indexSet.startIndex]
                    var task = tasks.taskListItems[index]
                    if task.isDeleted
                    {
                        TaskVM.deleteTask(task: task)
                    }
                    else {
                        task.isDeleted.toggle()
                        TaskVM.updateTask(task: task)
                    }
                    tasks.getTasks()
                })
            }
            
        }
    }
}

struct TaskSearchView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSearchView(tasks: TaskVM())
    }
}
