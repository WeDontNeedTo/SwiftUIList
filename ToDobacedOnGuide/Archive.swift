import SwiftUI
import Combine
struct Archive: View {
  @State var toDoArchive : [ToDoElement] = load("toDoData.json")
//    @Binding var toDoArchive : [ToDoElement]
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(toDoArchive.indices, id: \.self){ index in
                        if toDoArchive[index].isDone == true{
                        HStack{
                                Text(toDoArchive[index].description)
                                    .strikethrough()
                                Spacer()
                            CheckButton(isSet: $toDoArchive[index].isDone)
                        }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Archive")
        }
    }
}

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        Archive()
    }
}
