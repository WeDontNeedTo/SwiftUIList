import SwiftUI
import Firebase
import FirebaseAuth

struct SignUpView : View {
    
    @State var user = ""
    @State var pass = ""
    @State var message = ""
    @State var alert = false
    @Binding var show : Bool
    @ObservedObject var sign : SignFuncs
    var body : some View{
        
        VStack{
            Text("Sign Up").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
            
            VStack(alignment: .leading){
                
                VStack(alignment: .leading){
                    
                    Text("Username").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                    
                    HStack{
                        
                        TextField("Enter Your Username", text: $user)
                        
                        if user != ""{
                            
                            Image("check").foregroundColor(Color.init(.label))
                        }
                        
                    }
                    
                    Divider()
                    
                }.padding(.bottom, 15)
                
                VStack(alignment: .leading){
                    
                    Text("Password").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                    
                    SecureField("Enter Your Password", text: $pass)
                    
                    Divider()
                }
                
            }.padding(.horizontal, 6)
            
            Button(action: {
                
                sign.signUpWithEmail(email: self.user, password: self.pass) { (verified, status) in
                    
                    if !verified{
                        
                        self.message = status
                        self.alert.toggle()
                        
                    }
                    else{
                        
                        UserDefaults.standard.set(true, forKey: "status")
                        
                        self.show.toggle()
                        
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }
                }
                
            }) {
                
                Text("Sign Up").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                
                
            }.background(Color.black)
                .clipShape(Capsule())
                .padding(.top, 45)
            
        }.padding()
            .alert(isPresented: $alert) {
                
                Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
        }
    }
}



struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(show: .constant(false), sign: SignFuncs())
    }
}
