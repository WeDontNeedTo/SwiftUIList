import SwiftUI
import Combine

struct ToDoList: View {
    @State var toDoElements: [ToDoElement] = load("toDoData.json")
    @State private var isSet: Bool = false
    @State var showSheetView = false

//    var toDoElement: ToDoElement
//    @State var someArray:[ToDoElement]=[ToDoElement(id: 0, isDone: false, description: "Покушать"), ToDoElement(id: 1, isDone: true, description: "Погулять"), ToDoElement(id: 2, isDone: false, description: "Найти себя"),ToDoElement(id: 3, isDone: true, description: "Получить диплом"),]

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
//                List(toDoElements, id: \.id){ toDoElement in
//                    Text(toDoElement.description)
//                        .strikethrough(toDoElement.isDone)
//                    Spacer()
//                   // CheckButton(isSet: $toDoElement.isDone)
//
//                }
            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: buttonAdd)
            .sheet(isPresented: $showSheetView){
                AddToDoPage(showSheetView: self.$showSheetView, addnewtodo: self.$toDoElements)
            }
        }
        .padding(0.0)
    }
}

struct RowsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
    }
}
