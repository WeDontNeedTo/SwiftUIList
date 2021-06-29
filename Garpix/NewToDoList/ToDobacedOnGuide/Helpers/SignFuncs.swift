import UIKit
import FirebaseCore
import FirebaseAuth
import Foundation

class SignFuncs : ObservableObject {
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
}
