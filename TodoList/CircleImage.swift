//
//  CircleImage.swift
//  TodoList
//
//  Created by Владислав Положай on 24.05.2021.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("Ivanovo")
            .clipShape(Circle())
            .shadow(radius: 7)
            .overlay(Circle().stroke(Color.white, lineWidth: 1))
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
