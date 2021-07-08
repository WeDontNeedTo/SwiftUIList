import SwiftUI

struct AddToDoView: View {
    @Binding var showSheetView: Bool
    @Binding var addnewtodo:[ToDoElement]
    @State var newTodo : String = ""
    @ObservedObject var tasks: TaskList
    
    var ToDoField: some View{
        VStack{
            TextField("enter note here", text: $newTodo)
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
            .navigationBarTitle(Text("New Note"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.showSheetView = false
            })
            {
                Text("Cancel").bold()
            },
            trailing: Button(action: {
                tasks.addTask(task: ToDoElement(id: addnewtodo.capacity + 2, description: newTodo, isDeleted: false, isArcheveted: false))
                self.showSheetView = false
            }, label: {
                Text("Add")
            })
            
            
            )
            
        }
        
    }
//    func addTask() {
//        let task = ToDoElement(id: addnewtodo.count + 1, description: newTodo, isDeleted: false, isArcheveted: false)
//        tasks.addTask(task: task)
//        self.showSheetView = false
//
//    }
    
}





struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView(showSheetView: .constant(false), addnewtodo: .constant([]), tasks: TaskList())
    }
}
