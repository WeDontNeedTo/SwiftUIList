//
//  Archive.swift
//  ToDobacedOnGuide
//
//  Created by Владислав Положай on 09.06.2021.
//

import SwiftUI

struct Archive: View {
    @ObservedObject var tasks: TaskList
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Archive")
        }
    }
}

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        Archive(tasks: TaskList())
    }
}
