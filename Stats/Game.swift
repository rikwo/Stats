//
//  Game.swift
//  Stats
//
//  Created by Ricky Kwong on 2025-06-19.
//

import Foundation
import SwiftData

@Model
class Game {
    var points: Int
    var rebounds: Int
    var assists: Int
    var location: String
    var date: Date
    var quarters: Bool
    var durations: TimeInterval
    var team: Team
    
    init(points: Int = 0, rebounds: Int = 0, assists: Int = 0, location: String = "", date: Date = .now, quarters: Bool = false, durations: TimeInterval = 600, team: Team = .init()) {
        self.points = points
        self.rebounds = rebounds
        self.assists = assists
        self.location = location
        self.date = date
        self.quarters = quarters
        self.durations = durations
        self.team = team
    }
}
