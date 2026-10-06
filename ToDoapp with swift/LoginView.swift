//
//  LoginView.swift
//  ToDoapp with swift
//
//  Created by YamadaNaruto on 2026/10/02.
//
import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    var body: some View {
        NavigationStack{
            Text("ログイン")
            TextField("Email",text: $email)
            SecureField("password",text: $password)
            Button("ログイン"){
                Auth.auth().signIn(withEmail: email, password: password)
                
            }
            NavigationLink("新規登録はこちら",destination: SignUpView())
        }
        
    }
}
