import SwiftUI

struct MainView: View {
    @StateObject var tasks = TaskList()
    var body: some View {
        TabView {
            ToDoList(tasks: tasks)
                .tabItem {
                    Label("Notes", systemImage:
                            "house")
                }
            Archive(tasks: tasks)
                .tabItem {
                    Label("Done", systemImage:
                            "archivebox")
                }
            Trash(tasks: tasks)
                .tabItem {
                    Label("Deleted", systemImage:
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
