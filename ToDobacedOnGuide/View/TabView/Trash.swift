import SwiftUI

struct Trash: View {
    @ObservedObject var tasks: TaskList
    @State var isSet: Bool = false
    @State private var showActionSheet = false
    @State var idOfTask: Int = 0
    @State var isDeleted: Bool = true
    @State var text: String = ""
    
//    var filteredTasks: [ToDoElement] {
//        tasks.toDoElements.filter({$0.description.contains(text) || text.isEmpty})
//    }
    
    var body: some View {
        
        NavigationView{
            VStack{
                List{
                    HStack{
                        TextField("Enter text", text: $text)
                        Image(systemName: "magnifyingglass")
                    }
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
                        if (tasks.toDoElements[index].isDeleted){
                            HStack{
                                Text(tasks.toDoElements[index].description)
                                    .strikethrough(tasks.toDoElements[index].isArcheveted)
                                Spacer()
                                ActionTrashButton(isSet: $tasks.toDoElements[index].isArcheveted, isDeleted: $tasks.toDoElements[index].isDeleted, showActionSheet: $showActionSheet, tasks: tasks, idOfTask: index)
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Deleted")
        }
    }
}

struct TrashView_Previews: PreviewProvider {
    static var previews: some View {
        Trash(tasks: TaskList())
    }
    
}
