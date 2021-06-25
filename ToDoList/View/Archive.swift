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
                                    .strikethrough(tasks.toDoElements[index].isArcheveted)
                                Spacer()
                                CheckButton(isSet: $tasks.toDoElements[index].isArcheveted)
                                
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
            .navigationTitle("Done")
        }
    }
}

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        Archive(tasks: TaskList())
    }
}
