import SwiftUI
import Combine
// Here is state
struct RowsView: View {
    @State private var isSet: Bool = false
    @State var showSheetView = false
    @State var someArray:[ToDoElement]=[ToDoElement(id: 0, isDone: false, description: "Покушать"), ToDoElement(id: 1, isDone: true, description: "Погулять"), ToDoElement(id: 2, isDone: false, description: "Найти себя"),ToDoElement(id: 3, isDone: true, description: "Получить диплом"),]

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
                    ForEach(someArray.indices, id: \.self) { item in
                        HStack {
                            Text(someArray[item].description)
                                .strikethrough(someArray[item].isDone)
                            
                            Spacer()
                            CheckButton(isSet: $someArray[item].isDone)
                            
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: buttonAdd)
            .sheet(isPresented: $showSheetView){
                SheetView(showSheetView: self.$showSheetView, addnewtodo: self.$someArray)
            }
        }
        
        .padding(0.0)
        
    }
}

struct RowsView_Previews: PreviewProvider {
    static var previews: some View {
        RowsView()
    }
}
