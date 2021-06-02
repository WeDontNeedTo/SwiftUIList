//
//  TaskCardView.swift
//  Mint
//
//  Created by dmitry on 22.04.2021.
//

import SwiftUI

struct TaskCardView: View {
    @Binding var task: Task
    
    
    var body: some View {
        HStack{
            DoneButtonView(task: $task)
            TextField("",text: $task.tasksText)
                .foregroundColor(task.isDeleted ? .gray : task.isDone ? .gray : .black)
                .disabled(task.isDeleted)
            Spacer()
            if task.isDeleted{
                Divider()
                Button("Recover") {
                    withAnimation(.spring()) {
                        task.isDeleted.toggle()
                        TaskVM.updateTask(task: task)
                    };
                }
            }
        }
    }
}

struct TaskCardView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCardView(task: .constant(Task(tasksText: "to-do")))
            .previewLayout(.fixed(width: 300, height: 50))
    }
}
