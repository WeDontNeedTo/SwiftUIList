import SwiftUI

struct MainView: View {
    @StateObject var tasks = TaskList()
    @State private var selectedTab = 0
    @StateObject var signView = SignView()
    @StateObject var taskListViewModel = TaskListViewModel()
    var body: some View {
        TabView(selection: $selectedTab) {
            Archive(tasks: tasks)
                .tabItem {
                    Label("Done", systemImage:
                            "archivebox")
                }
                .tag(1)
            ToDoList(tasks: tasks, taskListViewModel: taskListViewModel)
                .tabItem {
                    Label("Notes", systemImage:
                            "house")
                }
                .tag(0)
            Trash(tasks: tasks)
                .tabItem {
                    Label("Deleted", systemImage:
                            "trash")
                }
                .tag(2)
        }
        
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(tasks: TaskList())
    }
}
