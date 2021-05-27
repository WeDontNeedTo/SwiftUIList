//
//  LandmarksApp.swift
//  TodoList
//
//  Created by Владислав Положай on 27.05.2021.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
