//
//  SignUpView.swift
//  ToDoapp with swift
//
//  Created by YamadaNaruto on 2026/10/05.
//
import SwiftUI
import FirebaseAuth
struct SignUpView: View{
    @State private var email:String=""
    @State private var password:String=""
    var body: some View{
        Text("新規登録")
        TextField("メールアドレス",text: $email)
        TextField("パスワード",text: $password)
        Button("新規登録"){
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
