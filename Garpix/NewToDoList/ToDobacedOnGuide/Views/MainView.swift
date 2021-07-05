//
//  MainView.swift
//  ToDobacedOnGuide
//
//  Created by Владислав Положай on 09.06.2021.
//

import SwiftUI

struct MainView: View {
    @StateObject var tasks = TaskItemModel()
    @State private var selectedTab = 0
    var body: some View {
        TabView (selection: $selectedTab) {
            RowsView (tasks: tasks)
                .tabItem{
                    Label("Home",systemImage: "house")
                }
                .tag(0)
            Archive(tasks: tasks)
                .tabItem{
                    Label("Archive",systemImage: "archivebox")
                }
                .tag(1)
            Trash(tasks: tasks)
                .tabItem{
                    Label("Trash",systemImage: "trash")
                }
                .tag(2)
            Account()
                .tabItem {
                    Label("Account", systemImage: "person.circle")
                }
                .tag(3)
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(tasks: TaskItemModel())
    }
}

