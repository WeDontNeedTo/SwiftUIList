//
//  CustomSearchBar.swift
//  ToDobacedOnGuide
//
//  Created by Артур Карачев on 28.06.2021.
//


import Foundation
import SwiftUI

struct CustomSearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    
    func makeUIView(context: UIViewRepresentableContext<CustomSearchBar>) -> UISearchBar {
        let searchbar = UISearchBar(frame: .zero)
        searchbar.delegate = context.coordinator
        return searchbar
    }
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<CustomSearchBar>) {
        uiView.text = text
    }
    
    func makeCoordinator() -> CustomSearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate  {
        
        @Binding var text: String
        
        init(text: Binding<String>){
            _text = text
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
            text = searchText
        }
    }
    
    
    }
