//
//  RootView.swift
//  ToDoapp with swift
//
//  Created by YamadaNaruto on 2026/10/05.
//
import SwiftUI
import FirebaseAuth
struct RootView: View{
    @State private var isLoggedIn = false
    
    
    var body: some View{
        
        Group{
            
            if isLoggedIn{
                ContentView()
            }else{
                LoginView()
            }
        }
        
        
        .onAppear{
            Auth.auth().addStateDidChangeListener({ (auth, user) in
                isLoggedIn = (user != nil)
            }
            )
            
        }
        
    }
}
