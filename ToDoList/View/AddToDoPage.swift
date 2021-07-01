import SwiftUI

struct AddToDoPage: View {
    @Binding var showSheetView: Bool
    @Binding var addnewtodo:[ToDoElement]
    @State var newTodo : String = ""
    @ObservedObject var taskListViewModel: TaskListViewModel
    
   
    
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
            trailing: Button(action: addTask {
//                addnewtodo.append (ToDoElement(id: addnewtodo.count, description: newTodo, isDeleted: false, isArcheveted: false))
//                print("в нью \(addnewtodo.count)")
//                self.showSheetView = false
                
            }, label: {
                Text("Add")
            }))
            
        }
        
    }
   
   
    private func addTask() {

        let task = ToDoElement(id: addnewtodo.count, description: newTodo , isDeleted: false, isArcheveted: false)
        print("в нью \(addnewtodo.count)")
        self.showSheetView = false

        taskListViewModel.add(task)
        
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoPage(showSheetView: .constant(false), addnewtodo: .constant([]), taskListViewModel: TaskListViewModel())
    }
}

