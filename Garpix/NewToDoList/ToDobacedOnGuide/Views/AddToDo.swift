import SwiftUI
struct AddToDo: View {
    @Binding var showAddToDo: Bool
    @Binding var addnewtodo: [ToDoElement]
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
            .navigationBarTitle(Text("New Task"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.showAddToDo = false
                
            })
            {
                Text("Cancel").bold()
            },
            trailing: Button(action: {
                addnewtodo.append(ToDoElement(id: addnewtodo.count + 1, description: newTodo, isDeleted: false, isArchived: false))
                                self.showAddToDo = false
                
            }, label: {
                Text("Add")
            }))
            
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDo(showAddToDo: .constant(false), addnewtodo: .constant([]))
    }
}
