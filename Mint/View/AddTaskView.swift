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
            VStack {
                Form {
                    TextField("Enter your task", text: $newTaskText)
                        .padding()
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
                            createNewTask()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
    
    private func createNewTask() {
        let newTask = Task(tasksText: newTaskText)
        tasks.taskListItems.append(newTask)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(tasks: TaskList())
    }
}
