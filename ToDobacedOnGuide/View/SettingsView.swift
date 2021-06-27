//
//  SettingsView.swift
//  ToDobacedOnGuide
//
//  Created by Артур Карачев on 28.06.2021.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SettingsView: View {
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    HStack{
                        Text("Hello, \((Auth.auth().currentUser?.email)!)")
                            .fontWeight(.heavy)
                            .padding([.top,.bottom],20)
                    }
                }
                
                List{
                    Button(action: {
                        UserDefaults.standard.set(false, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }, label: {
                        Text("Log Out")
                    })
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
