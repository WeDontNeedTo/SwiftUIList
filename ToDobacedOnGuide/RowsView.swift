import SwiftUI
import Combine

struct RowsView: View {
    @State var toDoElements: [ToDoElement] = load("toDoData.json")
//    @ObservedObject var taskStore = Tas
    @State private var showFavoritesOnly = false
    @State private var isSet: Bool = false
    @State var showSheetView = false

    var buttonAdd: some View {
        HStack{
            Button(action: {self.showSheetView.toggle()}, label: {
                Image(systemName: "square.and.pencil")
                    .foregroundColor(.yellow)
            })
        }
    }
    var body: some View {
        NavigationView{
            VStack{
                List {
                    Toggle(isOn: $showFavoritesOnly) {
                                       Text("Archive")
                                   }
                    ForEach(toDoElements.indices, id: \.self) { index in
                        HStack {
                            Text(toDoElements[index].description)
                                .strikethrough(toDoElements[index].isDone)
                            Spacer()
                            CheckButton(isSet: $toDoElements[index].isDone)
                        }
                        
                    }
                    .onDelete(perform: self.delete)
                }
                
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("To Do List")
            .navigationBarItems(leading: EditButton(), trailing: buttonAdd)
            .sheet(isPresented: $showSheetView) {
                SheetView(showSheetView: self.$showSheetView, addnewtodo: self.$toDoElements)
            }
        }
                .padding(0.0)
    }
//    func delete(at offsets : IndexSet) {
//        toDoElements.remove(atOffsets: offsets)
//    }
    func delete(at offsets : IndexSet) {
        toDoElements.remove(atOffsets: offsets)
    }
}

struct RowsView_Previews: PreviewProvider {
    static var previews: some View {
        RowsView()
    }
}
