import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        
        VStack{
            if status{
                MainView()
            }
            else{
                SignIn()
            }
        }.animation(.spring())
        .onAppear {
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                self.status = status
            }
        }
    }
}

func signInWithEmail(email: String,password : String,completion: @escaping (Bool,String)->Void){
    
    Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
        
        if err != nil{
            completion(false,(err?.localizedDescription)!)
            return
        }
        
        completion(true,(res?.user.email)!)
    }
}

func signUpWithEmail(email: String,password : String,completion: @escaping (Bool,String)->Void){
    Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
        
        if err != nil{
            completion(false,(err?.localizedDescription)!)
            return
        }
        completion(true,(res?.user.email)!)
    }
}


struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
