//
//  Trash.swift
//  ToDobacedOnGuide
//
//  Created by Владислав Положай on 09.06.2021.
//

import SwiftUI

struct Trash: View {
    @State var showAddToDo = false
    @ObservedObject var tasks: TaskList
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
                        if (tasks.toDoElements[index].isDeleted &&
                                tasks.toDoElements[index].isArchived){
                            HStack {
                                Text(tasks.toDoElements[index].description)
                                    .strikethrough(tasks.toDoElements[index].isArchived)
                                Spacer()
                                CheckButton(isSet: $tasks.toDoElements[index].isArchived
                                )
                                
                            }
                        }
                        
                    }
                    .onDelete(perform: { indexSet in
                        let index = indexSet[indexSet.startIndex]
                        tasks.toDoElements[index].isDeleted.toggle()
                    })
                }
                .listStyle(GroupedListStyle())            }
            .navigationTitle("Trash")
        }
    }
}

struct Trash_Previews: PreviewProvider {
    static var previews: some View {
        Trash(tasks: TaskList())
    }
}
