import SwiftUI
import Combine
struct SheetView: View {
    @Binding var showSheetView: Bool
    @Binding var addnewtodo: [ToDoElement]
    @State var newTodo : String = ""
    var ToDoField: some View{
          VStack{
               TextField("enter your todo", text: self.$newTodo)
                .textFieldStyle(RoundedBorderTextFieldStyle())
//            Button(action: {self.addnewtodo}, label: {
//                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//            })
          }
               }
    
//    func addNewToDo() {
//        addnewtodo.append(ToDoElement(id: Int(addnewtodo.count + 1),isDone: Bool(false),description: String("some text")))
//    }
    var body: some View {
        NavigationView {
            VStack{
                ToDoField
                    .padding()
                Spacer()
            }
            .navigationBarTitle(Text("Notifications"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                    self.showSheetView = false
                
                })
            {
                    Text("Cancel").bold()
                        
            },
            trailing: Button(action: {
                addnewtodo.append(ToDoElement(id: addnewtodo.count + 1, isDone: true, description: newTodo))
                self.showSheetView = false

                
            }, label: {
                Text("Add")
            }))

        }
    }
}



struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(showSheetView: .constant(false), addnewtodo: .constant([]))
    }
}
