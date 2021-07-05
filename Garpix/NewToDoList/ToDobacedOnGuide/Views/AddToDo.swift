//import SwiftUI
//struct AddToDo: View {
//    @Binding var showAddToDo: Bool
//    @Binding var addnewtodo: [ToDoElement]
//    @State var newTodo : String = ""
//    @State var newTaskText = ""
//    var tasks: TaskItemModel
//    var ToDoField: some View{
//        VStack{
//            TextField("enter your todo", text: self.$newTodo)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//        }
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack{
//                ToDoField
//                    .padding()
//                Spacer()
//            }
//            .navigationBarTitle(Text("New Task"), displayMode: .inline)
//            .navigationBarItems(leading: Button(action: {
//                self.showAddToDo = false
//
//            })
//            {
//                Text("Cancel").bold()
//            },
//            trailing: Button(action: {
//                createNewTask()
//                self.showAddToDo = false
//
//            }, label: {
//                Text("Add")
//            }))
//
//        }
//    }
//}
//
//private func createNewTask() {
//    let task = ToDoElement(id: addnewtodo.count, description: newTodo , isDeleted: false, isArcheveted: false)
//            print("в нью \(addnewtodo.count)")
//            tasks.createNewTask(task: task)
//            self.showAddToDo = false
//
//    }
//
//struct SheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddToDo(showAddToDo: .constant(false), addnewtodo: .constant([]), tasks: TaskItemModel())
//    }
//}

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
        let task = ToDoElement(id: addnewtodo.count, description: newTodo , isDeleted: false, isArchived: false)
        print("в нью \(addnewtodo.count)")
        tasks.addTask(task: task)
        self.showSheetView = false

    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoPage(showSheetView: .constant(false), addnewtodo: .constant([]), tasks: TaskItemModel())
    }
}
