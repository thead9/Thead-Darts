//
//  CricketScoreViewModel.swift
//  TheadDarts
//
//  Created by Thomas Headley on 11/17/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class CricketScoreViewModel: ObservableObject {
    
    var score: CricketScore
    
    @Published var marks: Marks
    
    var bullRequired: Bool = true
    
    init(cricketScore: CricketScore) {
        self.score = cricketScore
        
        marks = cricketScore.marks
        bullRequired = cricketScore.bullRequired
    }
    
    func shouldAllowHit(on wedge: Wedge) -> Bool {
        score.shouldAllowHit(on: wedge)
    }
    
    func hit(on wedge: Wedge, with multiplier: Multiplier) {
        score.hit(on: wedge, with: multiplier)
    }
}
