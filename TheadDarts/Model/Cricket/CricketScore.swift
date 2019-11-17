//
//  CricketScore.swift
//  TheadDarts
//
//  Created by Thomas Headley on 5/29/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class CricketScore: DartScore {
    typealias Score = CricketScore
        
    var scoreKeeper: CricketScoreKeeper = CricketScoreKeeper(playerUnits: [DartPlayerUnit<Score>]())

    var marks = Marks()
    
    var points: Int {
        get {
            marks.totalCricketPoints()
        }
    }
    
    var allClosed: Bool {
        get {
            if (
                !isWedgeClosed(.fifteen) ||
                !isWedgeClosed(.sixteen) ||
                !isWedgeClosed(.seventeen) ||
                !isWedgeClosed(.eightteen) ||
                !isWedgeClosed(.nineteen) ||
                !isWedgeClosed(.twenty)  ||
                !isWedgeClosed(.bull)
            ) {
                return false
            } else {
                return true
            }
        }
    }
    
    // MARK: Inits
    required init () { }
    
    func isWedgeClosed(_ wedge: Wedge) -> Bool {
        return marks[wedge] >= 3
    }
}

// MARK: Cricket Marks
extension Marks {
    func cricketPoints(for wedge: Wedge) -> Int {
        return self[wedge] > 3 ? wedge.rawValue * (self[wedge] - 3) : 0
    }
    
    func totalCricketPoints() -> Int {
        return (cricketPoints(for: .fifteen) +
                cricketPoints(for: .sixteen) +
                cricketPoints(for: .seventeen) +
                cricketPoints(for: .eightteen) +
                cricketPoints(for: .nineteen) +
                cricketPoints(for: .twenty) +
                cricketPoints(for: .bull))
    }
}

// MARK: Change Marks
extension CricketScore {
    func shouldAllowHit(on wedge: Wedge) -> Bool {
        return scoreKeeper.shouldAllowHit(on: wedge, for: self)
    }
    
    func shouldAllowScoring(on wedge: Wedge, with multiplier: Multiplier) -> Bool {
        return scoreKeeper.shouldAllowScoring(on: wedge, with: multiplier, for: self)
    }
    
    @discardableResult
    func hit(on wedge: Wedge, with multiplier: Multiplier) -> CricketScore {
        
        guard !(wedge == .bull && multiplier == .triple) else {
            return self
        }
        guard shouldAllowHit(on: wedge) else {
            return self
        }
        
        if wedge == .miss {
            scoreKeeper.hit(on: wedge, with: multiplier, for: self)
            return self
        }
        
        return registerHit(on: wedge, with: multiplier)
    }
    
    @discardableResult
    func registerHit(on wedge: Wedge, with multiplier: Multiplier) -> CricketScore {
        // All of the below need to occur in order to allow for proper logic evaluation
        // Only change the order if you know what you are doing
        let allowScoring = shouldAllowScoring(on: wedge, with: multiplier) || marks[wedge] + multiplier.rawValue < 3
        
        scoreKeeper.hit(on: wedge, with: multiplier, for: self)
        
        if allowScoring {
            marks[wedge] += multiplier.rawValue
        } else {
            marks[wedge] = 3
        }
        
        return self
    }
    
    @discardableResult
    func hit(on wedge: Wedge) -> CricketScore {
        self.hit(on: wedge, with: .single)
    }
    
    @discardableResult
    func undo(on wedge: Wedge, with multiplier: Multiplier) -> CricketScore {
        guard !(wedge == .bull && multiplier == .triple) else {
            return self
        }
        
        marks[wedge] -= multiplier.rawValue
        marks[wedge] = marks[wedge] < 0 ? 0 : marks[wedge]
        
        return self
    }
    
    func reset() {
        marks = Marks()
    }
}
