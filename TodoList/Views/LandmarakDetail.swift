//
//  LandmarakDetail.swift
//  TodoList
//
//  Created by Владислав Положай on 25.05.2021.
//

import SwiftUI

struct LandmarakDetail: View {
    var body: some View {
    VStack {
        MapView()
            .ignoresSafeArea(edges: .top)
            .frame(height: 300)
        
        CircleImage()
            .offset(y: -130)
            .padding(.bottom, -130)
        
    VStack(alignment: .leading) {
        Text("Shishki Corp")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    HStack {
        Text("Silver City")
        Spacer()
        Text ("Ivanovo state")

        }
            .font(.subheadline)
            .foregroundColor(.secondary)
        Divider()
        
        Text("About Shishki Corp")
            .font(.title2)
        Text("Descriptive text goes here.")
    }
    .padding()
    Spacer()
    }
}

struct LandmarakDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarakDetail()
        }
    }
}
