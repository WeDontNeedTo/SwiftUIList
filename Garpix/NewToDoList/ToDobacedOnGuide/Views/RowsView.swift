import SwiftUI
struct RowsView: View {
    @ObservedObject var tasks : TaskItemModel
    @State var isSet: Bool = false
    @State var showAddToDo = false
    @State private var searchText = ""
    var buttonAdd: some View {
        HStack{
            Button(action: {self.showAddToDo.toggle()}, label: {
                Image(systemName: "square.and.pencil")
                    .foregroundColor(.yellow)
            })
        }
    }
    
    var filteredTasks: [ToDoElement] {
            tasks.toDoElements.filter({$0.description.contains(searchText) || searchText.isEmpty})
        }
    
    var body: some View {
        NavigationView{
            VStack{
                SearchBar(text: $searchText)
                        .padding(.top, 7)
                List {
                    
                    ForEach(filteredTasks.indices, id: \.self) { index in
                        if (!filteredTasks[index].isDeleted &&
                                !filteredTasks[index].isArchived){
                            HStack {
                                Text(filteredTasks[index].description)
                                    .strikethrough(filteredTasks[index].isArchived)
                                Spacer()
                                CheckButton(isSet: $tasks.toDoElements[index].isArchived)
                            }
                            .onChange(of: self.tasks.toDoElements[index]) { task in tasks.updateTask(task: task)}
                        }
                        
                    }
                    .onDelete(perform: { indexSet in
                        let index = indexSet[indexSet.startIndex]
                        tasks.toDoElements[index].isDeleted.toggle()
                    })
                }
                .listStyle(GroupedListStyle())
            }
//            .onAppear{
//                tasks.getTasks()
//            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: buttonAdd)
            .sheet(isPresented: $showAddToDo){
                AddToDoPage(showSheetView: self.$showAddToDo, addnewtodo: self.$tasks.toDoElements, tasks: tasks)
            }
        }
    }
}

struct RowsView_Previews: PreviewProvider {
    static var previews: some View {
        RowsView(tasks: TaskItemModel())
    }
}
