import SwiftUI

struct ToDoList: View {
    @ObservedObject var tasks: TaskList
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
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
                        HStack {
                            Text(tasks.toDoElements[index].description)
                                .strikethrough(tasks.toDoElements[index].isDone)

                            Spacer()
                           // CheckButton(isSet: $toDoElements[index].isDone)
                           // CheckButton(isSet: tasks.toDoElements[index].isDone)

                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: buttonAdd)
            .sheet(isPresented: $showSheetView){
                AddToDoPage(showSheetView: self.$showSheetView, tasks: TaskList())
            }
        }
        .padding(0.0)
    }
}

struct RowsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList(tasks: TaskList())
    }
}
