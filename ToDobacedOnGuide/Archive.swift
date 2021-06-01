import SwiftUI
import Combine

struct Archive: View {
    @State private var isSet: Bool = false
   // @Binding someArray: [ToDoElement]
    var body: some View {
        NavigationView{
            VStack{
                Text("Some text")
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
