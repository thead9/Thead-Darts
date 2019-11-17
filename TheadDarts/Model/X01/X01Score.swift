//
//  X01Score.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/15/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class X01Score: DartScore {
    typealias Score = X01Score
        
    var scoreKeeper: X01ScoreKeeper = X01ScoreKeeper(playerUnits: [DartPlayerUnit<Score>]())

    var startingPoint: Int = 301
    var points: Int {
        get {
            startingPoint - marks.totalPoints()
        }
    }
    
    var marks = Marks()
    
    // MARK: Inits
    required init () { }

    init(startingPoint: Int = 301) {
        self.startingPoint = startingPoint
    }
    
    func shouldAllowHit(on wedge: Wedge, with multiplier: Multiplier) -> Bool {
        return scoreKeeper.shouldAllowHit(on: wedge, with: multiplier, for: self)
    }
}

// MARK: Change Marks
extension X01Score {
    @discardableResult
    func hit(on wedge: Wedge, with multiplier: Multiplier = .single) -> X01Score {
        guard !(wedge == .bull && multiplier == .triple) else {
            return self
        }
        guard shouldAllowHit(on: wedge, with: multiplier) else {
            return self
        }
        
        scoreKeeper.hit(on: wedge, with: multiplier, for: self)
        
        return registerHit(on: wedge, with: multiplier)
    }
    
    @discardableResult
    func registerHit(on wedge: Wedge, with multiplier: Multiplier) -> X01Score {
        marks[wedge] += multiplier.rawValue
        
        if points < 0 {
            undo(on: wedge, with: multiplier)
        }
        
        return self
    }
    
    @discardableResult
    func undo(on wedge: Wedge, with multiplier: Multiplier) -> X01Score {
        guard !(wedge == .bull && multiplier == .triple) else {
            return self
        }
        
        marks[wedge] -= multiplier.rawValue
        
        return self
    }
    
    func previewPointsForHit(on wedge: Wedge, with multiplier: Multiplier) -> Int {
        return points - (wedge.rawValue * multiplier.rawValue)
    }
    
    func reset() {
        marks = Marks()
    }
}
