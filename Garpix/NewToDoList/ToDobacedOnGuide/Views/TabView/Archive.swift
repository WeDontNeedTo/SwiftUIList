//
//  Archive.swift
//  ToDobacedOnGuide
//
//  Created by Владислав Положай on 09.06.2021.
//

import SwiftUI

struct Archive: View {
    @ObservedObject var tasks: TaskItemModel
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
                        if (!tasks.toDoElements[index].isDeleted &&
                                tasks.toDoElements[index].isArchived){
                            HStack {
                                Text(tasks.toDoElements[index].description)
                                    .strikethrough(tasks.toDoElements[index].isArchived)
                                Spacer()
                                CheckButton(isSet: $tasks.toDoElements[index].isArchived)
                            }
                        }
                        
                    }
                    .onDelete(perform: { indexSet in
                        let index = indexSet[indexSet.startIndex]
                        tasks.toDoElements[index].isDeleted.toggle()
                    })
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Archive")
        }
    }
}

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        Archive(tasks: TaskItemModel())
    }
}
