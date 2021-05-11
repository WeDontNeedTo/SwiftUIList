//
//  ContantView.swift
//  Mint
//
//  Created by dmitry on 29.04.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var tasks = TaskList()
    
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
        }
    }
}

struct ContantView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
