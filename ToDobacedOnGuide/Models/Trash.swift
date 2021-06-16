import SwiftUI

struct Trash: View {
    @ObservedObject var tasks: TaskList
    @State var isSet: Bool = false
//    @State private var isLongPressed = false
//    @GestureState private var isLongPressing = false
    var body: some View {
        
        NavigationView{
            VStack{
                List{
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
                        if (tasks.toDoElements[index].isDeleted){
                            HStack{
                                Text(tasks.toDoElements[index].description)
                                    .strikethrough(tasks.toDoElements[index].isArcheveted)
                                Spacer()
                                CheckButton(isSet: $tasks.toDoElements[index].isArcheveted)

                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Deleted")
        }
    }
}

struct TrashView_Previews: PreviewProvider {
    static var previews: some View {
        Trash(tasks: TaskList())
    }
}

//.gesture(LongPressGesture(minimumDuration: 1.0, maximumDistance: 400)
//            .onEnded({(_) in self.isLongPressed.toggle()})
//            .updating($isLongPressing) {value, state, _ in state=value}
//)
