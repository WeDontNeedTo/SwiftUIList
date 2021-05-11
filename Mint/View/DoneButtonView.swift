//
//  DoneButtonView.swift
//  Mint
//
//  Created by dmitry on 22.04.2021.
//

import SwiftUI

struct DoneButtonView: View {
    @Binding var isSet: Bool
    @State var isAnimate: Bool = true
    
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                isSet.toggle()
            }
        }) {
            Image(systemName: isSet ? "largecircle.fill.circle" : "circle" )
                .resizable()
                .scaledToFit()
                .frame(width: 22)
                .foregroundColor(Color.green)
                .animation(.default)
                .opacity(isAnimate ? 0 : 1)
                .transition(isAnimate ? .slide : .identity)
        }
        .onAppear {
            isAnimate = false
        }
        
    }
    
}

struct DoneButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DoneButtonView(isSet: .constant(false))
            DoneButtonView(isSet: .constant(false))

        }
    }
}
