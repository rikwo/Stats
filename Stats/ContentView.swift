//
//  ContentView.swift
//  Stats
//
//  Created by Ricky Kwong on 2025-06-19.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var games: [Game]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(games) { game in
                    NavigationLink(value: game) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(game.team.name).font(.headline)
                                Spacer()
                                Text(String(game.team.year))
                            }
                            Text(game.date.formatted(date: .long, time: .shortened))
                        }
                    }
                }
                .onDelete(perform: deleteGames)
            }
            .navigationTitle("Stats")
            .navigationDestination(for: Game.self, destination: EditGameView.init)
            .toolbar {
                Button("Add Samples", action: addSamples)
            }
        }
    }
    
    func addSamples() {
        let gameOne = Game(points: 20, rebounds: 4, assists: 10, location: "Langley Event Center", team: Team(name: "Drive Red 15U", year: 2025))
        let gameTwo = Game(points: 15, rebounds: 8, assists: 15, location: "Langley Event Center", team: Team(name: "Drive Red 15U", year: 2025))
        let gameThree = Game(points: 15, rebounds: 8, assists: 15, location: "Langley Event Center", team: Team(name: "Drive Red 15U", year: 2025))
        
        modelContext.insert(gameOne)
        modelContext.insert(gameTwo)
        modelContext.insert(gameThree)
        
    }
    
    func deleteGames(_ indexSet: IndexSet) {
        for index in indexSet {
            let game = games[index]
            modelContext.delete(game)
        }
    }
}

#Preview {
    ContentView()
}
