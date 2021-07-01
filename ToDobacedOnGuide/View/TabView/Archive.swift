import SwiftUI

struct Archive: View {
    @ObservedObject var tasks: TaskList
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
                        if (filteredTasks[index].isArcheveted && !filteredTasks[index].isDeleted){
                            HStack{
                                Text(filteredTasks[index].description)
                                    .strikethrough(tasks.toDoElements[index].isArcheveted)
                                Spacer()
                                CheckButton(isSet: $tasks.toDoElements[index].isArcheveted)
                                
                            }
                        }
                    }
                    .onDelete(perform: { indexSet in
                        let index = indexSet[indexSet.startIndex]
                        tasks.toDoElements[index].isDeleted.toggle()
                    })
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Done")
        }
    }
}

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        Archive(tasks: TaskList())
    }
}
