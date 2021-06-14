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
                Text("Junk")
            }
            .navigationTitle("Trash")
        }
    }
}

struct Trash_Previews: PreviewProvider {
    static var previews: some View {
        Trash(tasks: TaskList())
    }
}
