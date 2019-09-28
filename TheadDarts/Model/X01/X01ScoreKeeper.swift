//
//  X01ScoreKeeper.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/28/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class X01ScoreKeeper: DartScoreKeeper {
    typealias Player = X01Player
    typealias Score = X01Score

    var updated: () -> () = { }
    
    var playerUnits: [X01PlayerUnit]
    
    var activeIndex: Int = 0 {
        didSet {
            updated()
        }
    }
    
    var activeTurn: DartTurn<Score>?
    
    var gameActions = Stack<DartAction>()
    
    var winnerIndex: Int? {
        get {
            // MARK: TODO
            return nil
        }
    }
    var winner: Player? {
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
    init(playerUnits: [X01PlayerUnit]) {
        self.playerUnits = playerUnits
    }
    
    convenience init(playerUnits: [X01PlayerUnit], updated: @escaping () -> ()) {
        self.init(playerUnits: playerUnits)
        self.updated = updated
    }
    
    // MARK: Actions
    func shouldAllowHit(on wedge: Wedge, for score: Score) -> Bool {
        //var shouldAllowHit = false
        
        if scores.count == 0 { // this occurs when a score is not associated with a game
            return true
        }
        
        return true
    }
    
    func hit(on wedge: Wedge, with multiplier: Multiplier, for score: Score) {
        guard shouldAllowHit(on: wedge, for: score) else {
            return
        }
        
        let dartThrow = DartThrow(wedge: wedge, multiplier: multiplier, score: score)
        
        if var _ = activeTurn {
            self.activeTurn!.add(dartThrow)
            gameActions.push(DartThrowOnTurn(dartThrow: dartThrow, turn: self.activeTurn!))
        } else {
            gameActions.push(dartThrow)
        }
        updated()
    }
    
    func nextPlayer() {
        let oldActiveIndex = activeIndex
        activeIndex = oldActiveIndex + 1 >= playerUnits.count ? 0 : oldActiveIndex + 1
        gameActions.push(TurnChange(oldActiveIndex: oldActiveIndex, oldTurn: activeTurn!, newActiveIndex: activeIndex))
        activeTurn = DartTurn()
        updated()
    }
    
    func undo() {
        if let gameActionToUndo = gameActions.peek() as? DartThrow<X01Score> {
            gameActionToUndo.score.undo(on: gameActionToUndo.wedge, with: gameActionToUndo.multiplier)
        }
        if var gameActionToUndo = gameActions.peek() as? DartThrowOnTurn<X01Score> {
            activeTurn = gameActionToUndo.turn.undo()
            gameActionToUndo.dartThrow.score.undo(on: gameActionToUndo.dartThrow.wedge, with: gameActionToUndo.dartThrow.multiplier)
        }
        if let gameActionToUndo = gameActions.peek() as? TurnChange<X01Score> {
            activeIndex = gameActionToUndo.oldActiveIndex
            activeTurn = gameActionToUndo.oldTurn
        }
        
        gameActions.pop()
        updated()
    }
    
    func reset() {
        gameActions = Stack<DartAction>()
        if let _ = activeTurn {
            activeTurn = DartTurn()
        }
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
