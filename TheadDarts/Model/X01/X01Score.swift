//
//  X01Score.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/15/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

import Combine
import SwiftUI

class X01Score: DartScore {
    var objectWillChange = PassthroughSubject<Void, Never>()
    var updated: () -> () = { }
    
    var scoreKeeper: X01ScoreKeeper = X01ScoreKeeper(playerUnits: [X01PlayerUnit]())

    var startingPoint: Int = 301
    var points: Int {
        get {
            startingPoint - marks.totalPoints()
        }
    }
    
    var marks = Marks() {
        didSet {
            updated()
            objectWillChange.send(())
        }
    }
    
    // MARK: Inits
    required init () { }

    init(startingPoint: Int = 301, updated: @escaping () -> () = { }) {
        self.startingPoint = startingPoint
        self.updated = updated
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
