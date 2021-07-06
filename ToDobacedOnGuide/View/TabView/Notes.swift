import SwiftUI

struct Notes: View {
    @ObservedObject var tasks: TaskList
    @State var isSet: Bool = false
    @State var showSheetView = false
    @State var text: String = ""
    
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
    
    var filteredTasks: [ToDoElement] {
        tasks.toDoElements.filter({$0.description.contains(text) || text.isEmpty})
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    //CustomSearchBar(text: $text)
                    HStack{
                    TextField("Enter", text: $text)
                        Image(systemName: "magnifyingglass")
                }
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    
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
            .navigationBarItems(trailing: buttonAdd)
            .sheet(isPresented: $showSheetView){
                AddToDoView(showSheetView: self.$showSheetView, addnewtodo: self.$tasks.toDoElements, tasks: TaskList())
            }
        }
    }
}

struct RowsView_Previews: PreviewProvider {
    static var previews: some View {
        Notes(tasks: TaskList())
    }
}
