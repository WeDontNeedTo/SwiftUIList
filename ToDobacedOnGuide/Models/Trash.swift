import SwiftUI

struct Trash: View {
    @ObservedObject var tasks: TaskList
    @State var isSet: Bool = false
    var body: some View {
        
        NavigationView{
            VStack{
                List{
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
                        if (tasks.toDoElements[index].isDeleted && !tasks.toDoElements[index].isArcheveted){
                            HStack{
                                Text(tasks.toDoElements[index].description)
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
