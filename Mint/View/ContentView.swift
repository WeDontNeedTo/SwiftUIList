//
//  ContantView.swift
//  Mint
//
//  Created by dmitry on 29.04.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var tasks = TaskVM()
    
    var body: some View {
        TabView {
            MainView(tasks: tasks)
                .tabItem {
                    Label("To-Do", systemImage: "list.dash")
                }
            
            DeletedView(tasks: tasks)
                .tabItem {
                    Label("Deleted", systemImage: "trash")
                }
            
            TaskSearchView(tasks: tasks)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ContantView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
