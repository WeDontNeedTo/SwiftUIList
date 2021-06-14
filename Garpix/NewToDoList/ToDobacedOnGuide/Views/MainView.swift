//
//  MainView.swift
//  ToDobacedOnGuide
//
//  Created by Владислав Положай on 09.06.2021.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var tasks: TaskList
    var body: some View {
        TabView {
            RowsView(tasks: TaskList())
                .tabItem{
                    Label("Home",systemImage: "house")
                }
            Archive(tasks: TaskList())
                .tabItem{
                    Label("Archive",systemImage: "archivebox")
                }
            Trash(tasks: TaskList())
                .tabItem{
                    Label("Trash",systemImage: "trash")
                }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(tasks: TaskList())
    }
}

