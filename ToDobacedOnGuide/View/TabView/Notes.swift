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
    var body: some View {
        NavigationView{
            VStack{
                List {
                    CustomSearchBar(text: $text)
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
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
            .navigationBarItems(trailing: buttonAdd)
            .sheet(isPresented: $showSheetView){
                AddToDoView(showSheetView: self.$showSheetView, addnewtodo: self.$tasks.toDoElements)
            }
        }
    }
}

struct RowsView_Previews: PreviewProvider {
    static var previews: some View {
        Notes(tasks: TaskList())
    }
}
