//
//  ToDoapp_with_swiftApp.swift
//  ToDoapp with swift
//
//  Created by YamadaNaruto on 2026/09/22.
//

import SwiftUI
import SwiftData
import FirebaseCore





@main
struct ToDoapp_with_swiftApp: App {
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: Task.self)
    }
}
