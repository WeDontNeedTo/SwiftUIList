//
//  MainView.swift
//  ToDobacedOnGuide
//
//  Created by Владислав Положай on 09.06.2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            RowsView()
                .tabItem{
                    Label("Home",systemImage: "house")
                }
            Archive()
                .tabItem{
                    Label("Archive",systemImage: "archivebox")
                }
            Trash()
                .tabItem{
                    Label("Trash",systemImage: "trash")
                }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

