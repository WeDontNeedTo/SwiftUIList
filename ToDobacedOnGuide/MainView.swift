import SwiftUI

struct MainView: View {
    //@State var toDoElementss: [ToDoElement] = load("toDoData.json")
    var body: some View {
        TabView {
            
            ContentView()
                .tabItem {
                    Label("Main", systemImage:
                          "house")
                }
            Archive()
                .tabItem {
                    Label("Archeve", systemImage:
                          "archivebox")
                }
            TrashView()
                .tabItem {
                    Label("Trash", systemImage:
                          "trash")
                }

        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
          //  .environmentObject(Archive())
    }
}
