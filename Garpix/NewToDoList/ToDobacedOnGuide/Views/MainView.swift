//
//  MainView.swift
//  ToDobacedOnGuide
//
//  Created by Владислав Положай on 09.06.2021.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    @ObservedObject var tasks: TaskList
    var body: some View {
        TabView (selection: $selectedTab) {
            Archive(tasks: TaskList())
                .tabItem{
                    Label("Archive",systemImage: "archivebox")
                }
                .tag(1)
            RowsView (tasks: TaskList())
                .tabItem{
                    Label("Home",systemImage: "house")
                }
                .tag(0)
            Trash(tasks: TaskList())
                .tabItem{
                    Label("Trash",systemImage: "trash")
                }
                .tag(2)
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(tasks: TaskList())
    }
}

