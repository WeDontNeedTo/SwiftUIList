//
//  AddTaskView.swift
//  Mint
//
//  Created by dmitry on 22.04.2021.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var newTaskText = ""
    var tasks: TaskList

    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter your task", text: $newTaskText)
                Spacer()
            }
        .navigationBarTitle("New task", displayMode: .inline)
        .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let newTask = Task(tasksText: newTaskText)
                        tasks.TaskListItems.append(newTask)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(tasks: TaskList())
    }
}
