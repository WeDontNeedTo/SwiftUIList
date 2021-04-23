//
//  TaskCardView.swift
//  Mint
//
//  Created by dmitry on 22.04.2021.
//

import SwiftUI

struct TaskCardView: View {
    var task: Task
    var body: some View {
        HStack{
            DoneButtonView()
            Text(task.tasksText)
            Spacer()
        }
    }
}

struct TaskCardView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCardView(task: Task(tasksText: "to-do"))
            .previewLayout(.fixed(width: 300, height: 50))
    }
}
