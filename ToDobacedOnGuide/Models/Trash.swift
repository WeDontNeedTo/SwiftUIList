import SwiftUI

struct Trash: View {
    @ObservedObject var tasks: TaskList
    
    var body: some View {
        
        NavigationView{
            VStack{
                List{
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
                        if (tasks.toDoElements[index].isDeleted){
                        HStack{
                            Text(tasks.toDoElements[index].description)
                            Spacer()
                        }
                        }
                    }
                }
            }
            .navigationTitle("Deleted ToDo")
        }
    }
}

struct TrashView_Previews: PreviewProvider {
    static var previews: some View {
        Trash(tasks: TaskList())
    }
}
