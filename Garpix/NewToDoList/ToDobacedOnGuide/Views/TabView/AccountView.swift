import SwiftUI
import Firebase
import FirebaseAuth

struct Account: View {
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    CircleImage(image: Image("vlad"))
                        .padding([.top,.bottom]);
                    Text ("Имя пользователя")
                    HStack{
                        Text(" \((Auth.auth().currentUser?.email)!)")
                    }
                }
                List{
                    Button(action: {
                        UserDefaults.standard.set(false, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        
                    }) {
                        
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                }

            }
            .navigationBarTitle(Text("Account"),
                                displayMode: .inline)
        }
    }
}
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        Account()
    }
}
