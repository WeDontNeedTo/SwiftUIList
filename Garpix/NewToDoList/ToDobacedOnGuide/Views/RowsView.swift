import SwiftUI
import Combine
// Here is state
struct RowsView: View {
    @State var toDoElements: [ToDoElement] = load("tasksData.json")
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
                    ForEach(toDoElements.indices, id: \.self) { index in
                        HStack {
                            Text(toDoElements[index].description)
                                .strikethrough(toDoElements[index].isDone)
                            
                            Spacer()
                          CheckButton(isSet: $toDoElements[index].isDone)
                            
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: buttonAdd)
            .sheet(isPresented: $showSheetView){
               SheetView(showSheetView: self.$showSheetView, addnewtodo: self.$toDoElements)
            }
        }
        
        .padding(0.0)
        
    }
    func delete()
}

struct RowsView_Previews: PreviewProvider {
    static var previews: some View {
        RowsView()
    }
}
