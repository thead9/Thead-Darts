//
//  DartPlayerUnit.swift
//  TheadDarts
//
//  Created by Thomas Headley on 8/12/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class DartPlayerUnit<Score: DartScore>: Identifiable {
    var player: DartPlayer
    var score: Score
    
    let id = UUID()
    
    required init(player: DartPlayer, score: Score) {
        self.player = player
        self.score = score
    }
}
