import SwiftUI

struct Archive: View {
    @ObservedObject var tasks: TaskList
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
                        if (tasks.toDoElements[index].isArcheveted){
                        HStack{
                            Text(tasks.toDoElements[index].description)
                            Spacer()
                        }
                    }
                }
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
