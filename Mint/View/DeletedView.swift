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
                    
                    ForEach(0..<tasks.taskListItems.count, id: \.self) { index in
                        if  tasks.taskListItems[index].isDeleted{
                            HStack{
                                Text(tasks.taskListItems[index].tasksText)
                                    .foregroundColor(Color.gray)
                                Spacer()
                                Divider()
                                Button("Recover") {
                                    withAnimation(.spring()) {
                                        tasks.taskListItems[index].isDeleted.toggle()
                                    };
                                }
                        }
                            }
                        }
                        .onDelete(perform: { indexSet in
                            tasks.taskListItems.remove(atOffsets: indexSet)
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
