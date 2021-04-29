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
            DoneButtonView(isSet: $task.isDone)
            Text(task.tasksText).strikethrough(task.isDone)
            Spacer()
        }
    }
}

struct TaskCardView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCardView(task: .constant(Task(tasksText: "to-do")))
            .previewLayout(.fixed(width: 300, height: 50))
    }
}
