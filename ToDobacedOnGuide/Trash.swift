//
//  Trash.swift
//  ToDobacedOnGuide
//
//  Created by garpix on 01.06.2021.
//

import SwiftUI

struct Trash: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("list")
            }
            .navigationTitle("Trash")
        }
    }
}

struct Trash_Previews: PreviewProvider {
    static var previews: some View {
        Trash()
    }
}
