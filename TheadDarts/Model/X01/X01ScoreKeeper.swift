//
//  X01ScoreKeeper.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/28/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class X01ScoreKeeper: DartScoreKeeper {
    typealias Score = X01Score
    
    var playerUnits: [DartPlayerUnit<Score>]
    
    var activeIndex: Int = 0
    
    var activeTurn: DartTurn<Score> = DartTurn()
    
    var gameActions = Stack<DartAction>()
    
    var doubleOut: Bool
    
    var winnerIndex: Int? {
        get {
            for (index, playerUnit) in playerUnits.enumerated() {
                if playerUnit.score.points == 0 {
                    return index
                }
            }
            return nil
        }
    }
    var winner: DartPlayer? {
        get {
            if let index = winnerIndex {
                return playerUnits[index].player
            } else {
                return nil
            }
        }
    }
    var gameOver: Bool {
        get {
            if let _ = winner {
                return true
            }
            else {
                return false
            }
        }
    }
    
    // MARK: Inits
    init(playerUnits: [DartPlayerUnit<Score>], doubleOut: Bool = true) {
        self.playerUnits = playerUnits
        self.doubleOut = doubleOut
    }
    
    // MARK: Actions
    func shouldAllowHit(on wedge: Wedge, with multiplier: Multiplier, for score: Score) -> Bool {
        var shouldAllowHit = false
        
        if scores.count == 0 { // this occurs when a score is not associated with a game
            if !activeTurn.canAddThrow() {
                activeTurn = DartTurn()
            }
            return true
        }
        
        shouldAllowHit = activeTurn.canAddThrow()
        
        if shouldAllowHit {
            // Bust Checking
            var bust = false
            let previewPoints = score.previewPointsForHit(on: wedge, with: multiplier)
            
            if (previewPoints < 0 || (previewPoints == 1 && doubleOut) ) {
                bust = true
            } else if ( (previewPoints == 0 && multiplier != .double) && doubleOut ) {
                bust = true
            }
            if bust {
                self.activeTurn.undoAllThrows()
                registerHit(on: wedge, with: multiplier, for: score, bust: true)
                shouldAllowHit = false
            }
        }
        
        return shouldAllowHit
    }
    
    func hit(on wedge: Wedge, with multiplier: Multiplier, for score: Score) {
        guard shouldAllowHit(on: wedge, with: multiplier, for: score) else {
            return
        }
        
        registerHit(on: wedge, with: multiplier, for: score)
    }
    
    func registerHit(on wedge: Wedge, with multiplier: Multiplier, for score: Score, bust: Bool = false) {
        let dartThrow = DartThrow(wedge: wedge, multiplier: multiplier, score: score, bust: bust)
        
        self.activeTurn.add(dartThrow)
        gameActions.push(DartThrowOnTurn(dartThrow: dartThrow, turn: self.activeTurn))
    }
    
    func nextPlayer() {
        let oldActiveIndex = activeIndex
        activeIndex = oldActiveIndex + 1 >= playerUnits.count ? 0 : oldActiveIndex + 1
        gameActions.push(TurnChange(oldActiveIndex: oldActiveIndex, oldTurn: activeTurn, newActiveIndex: activeIndex))
        activeTurn = DartTurn()
    }
    
    func undo() {
        if var gameActionToUndo = gameActions.peek() as? DartThrowOnTurn<X01Score> {
            activeTurn = gameActionToUndo.turn.undo()
            gameActionToUndo.dartThrow.undo()
            
            if gameActionToUndo.dartThrow.bust {
                gameActionToUndo.turn.redoAllThrows()
            }
        }
        if let gameActionToUndo = gameActions.peek() as? TurnChange<X01Score> {
            activeIndex = gameActionToUndo.oldActiveIndex
            activeTurn = gameActionToUndo.oldTurn
        }
        
        gameActions.pop()
    }
    
    func reset() {
        gameActions = Stack<DartAction>()
        activeTurn = DartTurn()
        activeIndex = 0
    }
}

// MARK: Utility
extension X01ScoreKeeper {
    var scores: [Score] {
        get {
            var scoresToBeReturned = [Score]()
            for playerUnit in playerUnits {
                scoresToBeReturned.append(playerUnit.score)
            }
            return scoresToBeReturned
        }
    }
}
