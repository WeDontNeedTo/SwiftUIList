//
//  TaskCard.swift
//  Mint
//
//  Created by dmitry on 22.04.2021.
//

import SwiftUI

struct TaskCardView: View {
    var tasksText: String
    var body: some View {
        HStack{
            DoneButton()
            Text(tasksText)
            Spacer()
        }
    }
}

struct TaskCard_Previews: PreviewProvider {
    static var previews: some View {
        TaskCardView(tasksText: "to-do")
            .previewLayout(.fixed(width: 300, height: 50))
    }
}
