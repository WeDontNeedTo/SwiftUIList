import SwiftUI

struct MainView: View {
    @ObservedObject var tasks: TaskList
    var body: some View {
        TabView {
            // if (tasks.toDoElements[index].isArcheveted)
            ToDoList(tasks: TaskList())
                .tabItem {
                    Label("Main", systemImage:
                            "house")
                }
            Archive(tasks: TaskList())
                .tabItem {
                    Label("Archeve", systemImage:
                            "archivebox")
                }
            Trash(tasks: TaskList())
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
