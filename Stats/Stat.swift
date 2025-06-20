//
//  Stat.swift
//  Stats
//
//  Created by Ricky Kwong on 2025-06-20.
//

import Foundation
import SwiftData

enum Stat: CaseIterable, Hashable {
    case points, rebounds, assists
    
    var label: String {
        switch self {
        case .points: return "Points"
        case .rebounds: return "Rebounds"
        case.assists: return "Assists"
        }
    }
    
    var shortLabel: String {
        switch self {
        case .points: return "Point"
        case .rebounds: return "Rebound"
        case .assists: return "Assist"
        }
    }
    
    func value(from game: Game) -> Int {
        switch self {
        case.points: return game.points
        case .rebounds: return game.rebounds
        case .assists: return game.assists
        }
    }
}
