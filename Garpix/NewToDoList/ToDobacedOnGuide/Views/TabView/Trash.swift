//
//  Trash.swift
//  ToDobacedOnGuide
//
//  Created by Владислав Положай on 09.06.2021.
//

import SwiftUI

struct Trash: View {
    @ObservedObject var tasks: TaskItemModel
    @State var showActionSheet: Bool = false
    @State var isDelete : Bool = false
    @State var taskId : Int = 1
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
                        if (tasks.toDoElements[index].isDeleted) {
                            HStack {
                                Text(tasks.toDoElements[index].description)
                                Spacer()
                                RecoveryButton(showActionSheet: $showActionSheet, isDelete: $tasks.toDoElements[index].isDeleted,
                                               taskId: index,
                                               taskName: $tasks.toDoElements[index].description, tasks: tasks)
                            }
                            
                        }
                        
                    }
                    
                }
                
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Trash")
        }
    }
}
struct Trash_Previews: PreviewProvider {
    static var previews: some View {
        Trash(tasks: TaskItemModel())
    }
}

