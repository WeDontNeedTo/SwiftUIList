import SwiftUI
import Combine
// Here is state
struct RowsView: View {
    @State private var isSet: Bool = false
    @State var showSheetView = false
    @State var someArray:[ToDoElement]=[ToDoElement(id: 0, isDone: false, description: "gg"), ToDoElement(id: 1, isDone: true, description: "wp")]

    var buttonAdd: some View {
        HStack{
            Button(action: {self.showSheetView.toggle()}, label: {
                Image(systemName: "plus")
                
            })
        }
    }
    var body: some View {
        NavigationView{
            VStack{                    
                List {
                    ForEach(someArray) { item in
                        HStack {
                            Text(item.description)
                            Spacer()
                            CheckButton(isSet: item.isDone)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: buttonAdd)
            .sheet(isPresented: $showSheetView){
                SheetView(showSheetView: self.$showSheetView)
            }

            //.toolbar { EditButton() }
        }
        
        .padding(0.0)
        
    }
}

struct RowsView_Previews: PreviewProvider {
    static var previews: some View {
        RowsView()
    }
}
