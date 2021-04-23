//
//  ContentView.swift
//  Mint
//
//  Created by dmitry on 22.04.2021.
//

import SwiftUI




struct ContentView: View {
    @State private var showingSheet = false

    var body: some View {
        NavigationView {
            List{
                TaskCardView(tasksText: "Create first app")
            }
            .navigationTitle("To-do")
            .toolbar {
                Button(action: {
                    showingSheet.toggle()
                }
                    ) {
                        Image(systemName:"plus")
//                            .renderingMode(.original)
                            .foregroundColor(Color.green)
                    }
                        .sheet(isPresented: $showingSheet) {
                            
//                            SheetView()
                        }
//                    .buttonStyle(PlainButtonStyle())
//                    .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
