import SwiftUI
import Combine

struct TrashView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Some text")
            }
            .navigationTitle("Deleted ToDo")
        }
        .padding(0.0)
    }
}

struct TrashView_Previews: PreviewProvider {
    static var previews: some View {
        TrashView()
    }
}
