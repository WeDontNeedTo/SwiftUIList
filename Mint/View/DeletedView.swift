//
//  DeletedView.swift
//  Mint
//
//  Created by dmitry on 29.04.2021.
//

import SwiftUI

struct DeletedView: View {
    @ObservedObject var tasks: TaskList
    
    var body: some View {
        VStack{
            NavigationView {
                Form {
                        
                            ForEach(0..<tasks.TaskListItems.count, id: \.self) { index in
                                if  tasks.TaskListItems[index].isDeleted{
                                    TaskCardView(task: $tasks.TaskListItems[index])
                                }
                            }
                            .onDelete(perform: { indexSet in
                                tasks.TaskListItems.remove(atOffsets: indexSet)
                            })
                        }
                .navigationTitle("Deleted task's")
            }
        }
    }
}

struct DeletedView_Previews: PreviewProvider {
    static var previews: some View {
        DeletedView(tasks: TaskList())
    }
}
