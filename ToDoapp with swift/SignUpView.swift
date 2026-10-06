//
//  SignUpView.swift
//  ToDoapp with swift
//
//  Created by YamadaNaruto on 2026/10/05.
//
import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "person.badge.plus")
                .font(.system(size: 80))
                .foregroundColor(.blue)

            Text("新規登録")
                .font(.largeTitle)
                .bold()

            VStack(spacing: 12) {
                TextField("メールアドレス", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                SecureField("パスワード", text: $password)
                    .textFieldStyle(.roundedBorder)
            }

            Button {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }
            } label: {
                Text("新規登録")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
    }
}
