//
//  LoginView.swift
//  ToDoapp with swift
//
//  Created by YamadaNaruto on 2026/10/02.
//
import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)

                Text("ログイン")
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
                    Auth.auth().signIn(withEmail: email, password: password)
                } label: {
                    Text("ログイン")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                NavigationLink("新規登録はこちら", destination: SignUpView())
                    .foregroundColor(.blue)
            }
            .padding()
        }
    }
}
