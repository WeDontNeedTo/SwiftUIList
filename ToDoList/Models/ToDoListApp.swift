import SwiftUI
import Firebase

@main
struct ToDoListApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    
    var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
