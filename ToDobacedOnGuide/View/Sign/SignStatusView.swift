//
//  SignStatusView.swift
//  ToDobacedOnGuide
//
//  Created by Артур Карачев on 28.06.2021.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignStatusView: View {
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    var body: some View {
        
        VStack{
            
            if status{
                MainView()
            }
            else{
                SignInView(signUser: SignUser())
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

struct SignStatusView_Previews: PreviewProvider {
    static var previews: some View {
        SignStatusView()
    }
}
