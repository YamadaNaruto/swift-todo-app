//
//  ContentView.swift
//  ToDoapp with swift
//
//  Created by YamadaNaruto on 2026/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    @State private var taskName = ""
    @State var TaskLists: [String] = []
    var body: some View {
        VStack {
            Text("TODO アプリ")
                .font(.largeTitle)
            Button("タスクの追加"){
                isPresented = true
            }
            List(TaskLists, id: \.self){ TaskList in
                Text(TaskList)
            }
                
            
            .font(.largeTitle)
            .sheet(isPresented: $isPresented) {
                Text("タスクの追加")
                TextField("ここに入力", text: $taskName)
                Button("追加"){
                    TaskLists.append(taskName)
                }
                
                
                
            
                
                 }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
