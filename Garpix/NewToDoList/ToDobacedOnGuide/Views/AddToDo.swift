
import SwiftUI

struct AddToDoPage: View {
    @Binding var showSheetView: Bool
    @Binding var addnewtodo:[ToDoElement]
    @State var newTodo : String = ""
    @ObservedObject var tasks: TaskItemModel
    
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
            trailing: Button(action: addTask) {
                Text("Add")
            })
            
        }
        
    }
   
   
    private func addTask() {
        //let task = ToDoElement(id: addnewtodo.count + 1, description: newTodo , isDeleted: false, isArchived: false)
        let task = ToDoElement( description: newTodo , isDeleted: false, isArchived: false)
        tasks.addTask(task: task)
        self.showSheetView = false

    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoPage(showSheetView: .constant(false), addnewtodo: .constant([]), tasks: TaskItemModel())
    }
}
