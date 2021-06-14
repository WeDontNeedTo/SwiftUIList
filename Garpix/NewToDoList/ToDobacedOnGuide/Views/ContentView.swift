import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView( tasks: TaskList())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

