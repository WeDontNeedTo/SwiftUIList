//
//  MainView.swift
//  ToDobacedOnGuide
//
//  Created by garpix on 01.06.2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            Trash()
                .tabItem {
                    Label("Trash", systemImage: "trash")
                }
            ContentView()
                .tabItem {
                    Label("Main", systemImage: "house")
                }
            Archive()
                .tabItem {
                    Label("Archive", systemImage: "archivebox")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
//            .environmentObject(Archive())
    }
}
