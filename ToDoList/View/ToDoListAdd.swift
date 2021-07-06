import SwiftUI


struct ToDoList: View {
    @ObservedObject var tasks: TaskList
    @State var isSet: Bool = false
    @State var showSheetView = false
    @State var searchText = ""

    
    var buttonAdd: some View {
        HStack{
            Button(action: {self.showSheetView.toggle()}, label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 23, height: 23, alignment: .center)

            })
        }
    }
    var exitButton: some View {
        Button(action: {
                       UserDefaults.standard.set(false, forKey: "status")
                       NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                       
                   }) {
                       Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.yellow)
                }
    }
    
    var filteredTasks: [ToDoElement] {
        tasks.toDoElements.filter({$0.description.contains(searchText) || searchText.isEmpty})
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
                SearchBar(text: $searchText)

                List {
                    ForEach(filteredTasks.indices, id: \.self) { index in
                        if (!filteredTasks[index].isDeleted && !filteredTasks[index].isArcheveted) {
                            HStack {
                                Text(filteredTasks[index].description)
                                    .strikethrough(filteredTasks[index].isArcheveted)
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
            .onAppear{
                tasks.getTasks()
            }
            .navigationTitle("Notes")
            .navigationBarItems(leading: exitButton,
                                trailing: buttonAdd)
            .sheet(isPresented: $showSheetView){
                AddToDoPage(showSheetView: self.$showSheetView, addnewtodo: self.$tasks.toDoElements, tasks: TaskList())
            }
        }
    }
}


struct RowsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList(tasks: TaskList())
    }
}
