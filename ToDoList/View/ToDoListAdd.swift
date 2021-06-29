import SwiftUI


struct ToDoList: View {
    @ObservedObject var tasks: TaskList
    @State var isSet: Bool = false
    @State var showSheetView = false
    @State private var searchText = ""
    
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
    var body: some View {
        NavigationView{
            VStack{
                SearchBar(text: $searchText)
                                    
//                tasks.toDoElements.filter({self.searchText.isEmpty ? true : $0.description.contains(searchText)})
                
                List {
                    ForEach((tasks.toDoElements.indices).filter({"\($0)".description.contains(searchText) || searchText.isEmpty}), id: \.self) { index in
                        if (!tasks.toDoElements[index].isDeleted && !tasks.toDoElements[index].isArcheveted) {
                            HStack {
                                Text(tasks.toDoElements[index].description)
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
            .navigationTitle("Notes")
            .navigationBarItems(leading: exitButton,
                                trailing: buttonAdd)
            .sheet(isPresented: $showSheetView){
                AddToDoPage(showSheetView: self.$showSheetView, addnewtodo: self.$tasks.toDoElements)
            }
        }
    }
}

struct RowsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList(tasks: TaskList())
    }
}
