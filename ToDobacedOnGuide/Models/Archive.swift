import SwiftUI

struct Archive: View {
    @ObservedObject var tasks: TaskList
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
                        if (tasks.toDoElements[index].isArcheveted && !tasks.toDoElements[index].isDeleted){
                        HStack{
                            Text(tasks.toDoElements[index].description)
                                .strikethrough(tasks.toDoElements[index].isDone)
                            Spacer()
                            CheckButton(isSet: $tasks.toDoElements[index].isDone)    
                        }
                    }
                }
                    .onDelete(perform: { indexSet in
                        let index = indexSet[indexSet.startIndex]
                        tasks.toDoElements[index].isDeleted.toggle()
                    })
            }
            .listStyle(GroupedListStyle())
        }
            .navigationTitle("Archeve")
    }
}
}

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        Archive(tasks: TaskList())
    }
}
