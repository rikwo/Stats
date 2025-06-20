//
//  EditGameView.swift
//  Stats
//
//  Created by Ricky Kwong on 2025-06-19.
//

import SwiftUI
import SwiftData

/*struct EditGameView: View {
    
    @Bindable var game: Game
    
    var body: some View {
        Text("Points: " + String(game.points))
        Text("Rebounds: " + String(game.rebounds))
        Text("Assists: " + String(game.assists))
        Form {
            HStack {
                Button("Add Point", action: addPoint)
                Spacer()
                Button("Remove Point", action: removePoint)
            }
            HStack {
                Button("Add Rebound", action: addRebound)
                Spacer()
                Button("Remove Rebound", action: removeRebound)
            }
            HStack {
                Button("Add Assist", action: addAssist)
                Spacer()
                Button("Remove Assist", action: removeAssist)
            }
        }
    }
    
    func addPoint() {
        game.points += 1
    }
    
    func removePoint() {
        game.points -= 1
    }
    
    func addRebound() {
        game.rebounds += 1
    }
    
    func removeRebound() {
        game.rebounds -= 1
    }
    
    func addAssist() {
        game.assists += 1
    }
    
    func removeAssist() {
        game.assists -= 1
    }
    
}*/


struct EditGameView: View {
    @Bindable var game: Game
    
    var body: some  View {
        Form {
            DatePicker("Date", selection: $game.date)
            ForEach(Stat.allCases, id: \.self) { stat in
                Section {
                    Text("\(stat.label): \(stat.value(from: game))")
                    HStack {
                        Button("Add \(stat.shortLabel)", action: { update(stat, by: 1)})
                            .buttonStyle(.borderedProminent)

                        Spacer()
                        Button("Remove \(stat.shortLabel)", action: { update(stat, by: -1)})
                            .buttonStyle(.bordered)

                    }
                }
            }
        }
        .navigationTitle("Edit Game Stats")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func update(_ stat: Stat, by amount: Int) {
        switch stat {
        case .points: game.points += amount
        case .rebounds: game.rebounds += amount
        case .assists: game.assists += amount
        }
        print("Updated \(stat.label): \(stat.value(from: game))")
    }
}



#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Game.self, configurations: config)
        let example = Game(points: 20, rebounds: 4, assists: 10, location: "Langley Event Center", team: Team(name: "Drive Red 15U", year: 2025))
        return EditGameView(game: example).modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
