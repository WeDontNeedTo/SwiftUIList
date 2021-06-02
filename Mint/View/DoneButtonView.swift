//
//  DoneButtonView.swift
//  Mint
//
//  Created by dmitry on 22.04.2021.
//

import SwiftUI

struct DoneButtonView: View {
    @Binding var task: Task
    @State var isAnimate: Bool = true
    
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                task.isDone.toggle()
                TaskVM.updateTask(task: task)
            }
        }) {
            Image(systemName: task.isDone ? "largecircle.fill.circle" : "circle" )
                .resizable()
                .scaledToFit()
                .frame(width: 22)
                .foregroundColor(task.isDeleted ? .gray : .green)
                .animation(.default)
                .opacity(isAnimate ? 0 : 1)
                .transition(isAnimate ? .slide : .identity)
        }
        .disabled(task.isDeleted)
        .onAppear {
            isAnimate = false
        }
        
    }
    
}

struct DoneButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DoneButtonView(task: .constant(Task(tasksText: "to-do")))
            
        }
    }
}
