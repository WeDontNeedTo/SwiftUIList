//
//  MintApp.swift
//  Mint
//
//  Created by dmitry on 22.04.2021.
//

import SwiftUI
import Firebase


@main
struct MintApp: App {
    init() {
      FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .accentColor(.green)
        }
    }
}
