import SwiftUI

struct MainView: View {
    @StateObject var tasks = TaskList()
    var body: some View {
        TabView {
            ToDoList(tasks: tasks)
                .tabItem {
                    Label("Main", systemImage:
                            "house")
                }
            Archive(tasks: tasks)
                .tabItem {
                    Label("Archeve", systemImage:
                            "archivebox")
                }
            Trash(tasks: tasks)
                .tabItem {
                    Label("Trash", systemImage:
                            "trash")
                }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(tasks: TaskList())
    }
}
