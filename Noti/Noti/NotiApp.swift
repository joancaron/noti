//
//  NotiApp.swift
//  Noti
//
//  Created by Joan Caron on 10.11.2023.
//

import SwiftUI
import SwiftData

@main
struct NotiApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        MenuBarExtra("App Menu Bar Extra", systemImage: "star") {
            ContentView()
                .frame(minWidth: 500, minHeight: 600)
                .background(.ultraThinMaterial)
                .modelContainer(sharedModelContainer)
        }
        .menuBarExtraStyle(.window)
    }
}
