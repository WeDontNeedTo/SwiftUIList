//
//  ToDobacedOnGuideApp.swift
//  ToDobacedOnGuide
//
//  Created by Garpix on 26.05.2021.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main

struct ToDobacedOnGuideApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var appDelegate
    var body: some Scene {
        WindowGroup {
            SignCheck(tasks: TaskItemModel())
        }
    }
}
