//
//  Archive.swift
//  ToDobacedOnGuide
//
//  Created by Владислав Положай on 09.06.2021.
//

import SwiftUI

struct Archive: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Completed tasks")
            }
            .navigationTitle("Archive")
        }
    }
}

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        Archive()
    }
}
