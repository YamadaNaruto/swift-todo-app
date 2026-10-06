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
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    @Bindable var task = task
                    Toggle(isOn: $task.isCompleted) {
                        Text(task.name)
                            .strikethrough(task.isCompleted)
                            .foregroundColor(task.isCompleted ? .gray : .primary)
                    }
                }
                .onDelete { offsets in
                    offsets.forEach { index in
                        modelContext.delete(tasks[index])
                    }
                }
            }
            .navigationTitle("TODO")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresented) {
                VStack(spacing: 24) {
                    Text("タスクの追加")
                        .font(.title2)
                        .bold()
                    TextField("タスク名を入力", text: $taskName)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        let newTask = Task(name: taskName)
                        modelContext.insert(newTask)
                        taskName = ""
                        isPresented = false
                    } label: {
                        Text("追加")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding()
                .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    ContentView()
}
