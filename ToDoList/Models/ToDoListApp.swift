import SwiftUI
import Firebase

@main
struct ToDoLostApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
