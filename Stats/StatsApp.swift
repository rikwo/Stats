//
//  StatsApp.swift
//  Stats
//
//  Created by Ricky Kwong on 2025-06-19.
//

import SwiftUI
import SwiftData

@main
struct StatsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Game.self)
    }
}
