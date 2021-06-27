//
//  SignInView.swift
//  ToDobacedOnGuide
//
//  Created by Артур Карачев on 27.06.2021.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignInView: View {
    
    @State var user = ""
    @State var password = ""
    @State var alert = false
    @State var message = ""
    @State var show = false
    
    var body: some View {
        VStack{
            Text("Sign In")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding([.top,.bottom],20)
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Username")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label).opacity(0.75))
                    HStack{
                        TextField("Enter Your Username", text: $user)
                    }
                    Divider()
                }.padding(.bottom, 15)
                
                VStack(alignment: .leading){
                    Text("Password")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label).opacity(0.75))
                    HStack{
                        SecureField("Enter Your Password", text: $password)
                    }
                    Divider()
                }
            }.padding()
            Button(action: {
                signInWithEmail(email: self.user, password: self.password) { (verified, status) in
                    
                    if !verified {
                        
                        self.message = status
                        self.alert.toggle()
                    }
                    else{
                        
                        UserDefaults.standard.set(true, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }
                }
            }, label: {
                Text("Sign In")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
                    .background(Color.black)
                    .clipShape(Capsule())
                    .padding(.top, 45)
            })
            .alert(isPresented: $alert) {
                Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
            }
            VStack(){
                HStack{
                    Text("Don't have an account?")
                        .foregroundColor(Color.gray.opacity(0.5))
                    Button(action: {
                        self.show.toggle()
                    }, label: {
                        Text("Sign Up")
                    })
                }
                
            } .padding(.top, 80)
            .sheet(isPresented: $show, content: {
                SignUpView(show: $show)
            })
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



struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
