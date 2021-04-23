//
//  DoneButton.swift
//  Mint
//
//  Created by dmitry on 22.04.2021.
//

import SwiftUI

struct DoneButton: View {
    @State var isSet: Bool = false
    
    
    var body: some View {
        Button(action: {
            isSet.toggle()
            }) {
            Image(systemName: isSet ? "largecircle.fill.circle" : "circle" )
                .resizable()
                .scaledToFit()
                .frame(width: 22)
                .foregroundColor(Color.green)
                    
            }
    }
    
}

struct DoneButton_Previews: PreviewProvider {
    static var previews: some View {
        DoneButton()
    }
}
