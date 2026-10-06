//
//  ContentView.swift
//  ToDoapp with swift
//
//  Created by YamadaNaruto on 2026/09/22.
//
import SwiftData
import SwiftUI


struct ContentView: View {
    @State private var isPresented: Bool = false
    @State private var taskName = ""
    @Query var tasks: [Task]
    @Environment(\.modelContext)  private var modelContext
    var body: some View {
        NavigationStack {
            Text("TODO アプリ")
                .font(.largeTitle)
            Button("タスクの追加"){
                isPresented = true
            }
            //タスクリストを表示
            Text("タスク数: \(tasks.count)")
            List{
                ForEach(tasks){task in
                    @Bindable var task = task
                    Toggle(task.name,isOn : $task.isCompleted)
                        .strikethrough(task.isCompleted)
                }.onDelete(perform: { offsets in
                    offsets.forEach { index in
                        modelContext.delete(tasks[index])
                    }
                })
                
                
                
            }
            
            .sheet(isPresented: $isPresented) {
                Text("タスクの追加")
                TextField("ここに入力", text: $taskName)
                Button("追加"){
                    //tasksに追加
                    let newTask = Task(name: taskName)
                    
                    modelContext.insert(newTask)
                    taskName = ""
                    isPresented = false
                    
                    
                    
                }
            }
        }
    }
}
        #Preview {
            ContentView()
        }
