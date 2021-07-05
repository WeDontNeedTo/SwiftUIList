import SwiftUI
import Firebase
import FirebaseAuth

struct SignCheck: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @ObservedObject var tasks: TaskItemModel
    var body: some View {
        
        VStack{
            
            if status{
                
                MainView()
            }
            else{
                
                SignInView(sign: SignFuncs())
            }
            
        }.animation(.spring())
            .onAppear {
                tasks.getTasks()
                NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                    
                    let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                    self.status = status
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignCheck(tasks: TaskItemModel())
    }
}
