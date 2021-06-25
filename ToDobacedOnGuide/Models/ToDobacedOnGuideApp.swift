import SwiftUI

@main
struct ToDobacedOnGuideApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            //MainView()
            SignView()
        }
    }
}
