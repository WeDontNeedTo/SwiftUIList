import SwiftUI
struct RowsView: View {
    @ObservedObject var tasks : TaskList
    @State var isSet: Bool = false
    @State var showAddToDo = false
    
    var buttonAdd: some View {
        HStack{
            Button(action: {self.showAddToDo.toggle()}, label: {
                Image(systemName: "square.and.pencil")
                    .foregroundColor(.yellow)
            })
        }
    }
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
                        if (!tasks.toDoElements[index].isDeleted &&
                                !tasks.toDoElements[index].isArchived){
                            HStack {
                                Text(tasks.toDoElements[index].description)
                                    .strikethrough(tasks.toDoElements[index].isArchived)
                                Spacer()
                                CheckButton(isSet: $tasks.toDoElements[index].isArchived)
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
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: buttonAdd)
            .sheet(isPresented: $showAddToDo){
                AddToDo(showAddToDo: self.$showAddToDo, addnewtodo: self.$tasks.toDoElements)
            }
        }
    }
}

struct RowsView_Previews: PreviewProvider {
    static var previews: some View {
        RowsView(tasks: TaskList())
    }
}
