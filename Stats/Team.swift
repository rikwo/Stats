//
//  Team.swift
//  Stats
//
//  Created by Ricky Kwong on 2025-06-19.
//

import Foundation
import SwiftData

@Model
class Team {
    var name: String
    var year: Int
    
    init(name: String = "", year: Int = Calendar.current.component(.year, from: Date())) {
        self.name = name
        self.year = year
    }
}

