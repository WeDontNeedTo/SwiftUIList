import SwiftUI
import Combine

struct Archive: View {
    @State var toDoElements: [ToDoElement] = load("toDoData.json")
    //@ObservedObject var toDoElements: ToDoElement
   // @State private var isSet: Bool = false
    //@ObservedObject var isSet: Bool
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(toDoElements.indices, id: \.self) { index in
                        if (toDoElements[index].isDone){
                        HStack {
                                Text(toDoElements[index].description)
                                    .strikethrough()
                            Spacer()
                            CheckButton(isSet: $toDoElements[index].isDone)

                        }
                    }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Archeve")
        }
        .padding(0.0)
    }
    
}

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        Archive()
    }
}
