import SwiftUI

struct AddToDoPage: View {
    @Binding var showSheetView: Bool
    @ObservedObject var tasks: TaskList
    @State var newTodo : String = ""
    
    var ToDoField: some View{
          VStack{
               TextField("enter your todo", text: self.$newTodo)
                .textFieldStyle(RoundedBorderTextFieldStyle())
          }
    }
    
    var body: some View {
        NavigationView {
            VStack{
                ToDoField
                    .padding()
                Spacer()
            }
            .navigationBarTitle(Text("New ToDo"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                    self.showSheetView = false
                })
            {
                    Text("Cancel").bold()
            },
            trailing: Button(action: {
                tasks.toDoElements.append(ToDoElement(id: tasks.toDoElements.count + 1, isDone: false, description: newTodo, isDeleted: false, isArcheveted: false)
                )
               // addnewtodo.toDoElements.append(ToDoElement(id: addnewtodo.toDoElements.count + 1, isDone: false, description: newTodo, isDeleted: false, isArcheveted: false))
                self.showSheetView = false
            }, label: {
                Text("Add")
            }))
        }
    
    }
}



struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoPage(showSheetView: .constant(false), tasks: TaskList())
    }
}
