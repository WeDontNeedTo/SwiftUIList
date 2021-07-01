import SwiftUI

struct Trash: View {
    @ObservedObject var tasks: TaskList
    @State var isSet: Bool = false
    @State private var showActionSheet = false
    @State var idOfTask: Int = 0
    @State var isDeleted: Bool = true
    @State var text: String = ""
    
    var filteredTasks: [ToDoElement] {
        tasks.toDoElements.filter({$0.description.contains(text) || text.isEmpty})
    }
    
    var body: some View {
        
        NavigationView{
            VStack{
                List{
                    CustomSearchBar(text: $text)
                    ForEach(filteredTasks.indices, id: \.self) { index in
                        if (filteredTasks[index].isDeleted){
                            HStack{
                                Text(filteredTasks[index].description)
                                    .strikethrough(filteredTasks[index].isArcheveted)
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
