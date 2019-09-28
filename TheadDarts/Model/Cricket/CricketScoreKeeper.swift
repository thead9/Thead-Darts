//
//  CricketScoreKeeper.swift
//  TheadDarts
//
//  Created by Thomas Headley on 6/29/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class CricketScoreKeeper: DartScoreKeeper {
    typealias Player = CricketPlayer
    typealias Score = CricketScore
    
    var updated: () -> () = { }
    
    var playerUnits: [CricketPlayerUnit]
    
    var activeIndex: Int = 0 {
        didSet {
            updated()
        }
    }
    
    var activeTurn: DartTurn<Score>?
    
    var gameActions = Stack<DartAction>()
    
    var winnerIndex: Int? {
        get {
            // TODO add logic for not playing with points
            var indexOfPointsLeaderWithAllClosed = -1
            var indexOfPointsLeader = -1
            for (index, playerUnit) in playerUnits.enumerated() {
                let score = playerUnit.score
                if indexOfPointsLeader == -1 {
                    indexOfPointsLeader = index
                } else {
                    if score.points > playerUnits[indexOfPointsLeader].score.points {
                        indexOfPointsLeader = index
                    }
                }
                if score.allClosed {
                    if indexOfPointsLeaderWithAllClosed == -1 {
                        indexOfPointsLeaderWithAllClosed = index
                    } else if score.points > playerUnits[indexOfPointsLeaderWithAllClosed].score.points {
                        indexOfPointsLeaderWithAllClosed = index
                    }
                }
            }
            
            guard indexOfPointsLeaderWithAllClosed != -1 else {
                return nil
            }
            return indexOfPointsLeader == indexOfPointsLeaderWithAllClosed ? indexOfPointsLeaderWithAllClosed : nil
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
    init(playerUnits: [CricketPlayerUnit]) {
        self.playerUnits = playerUnits
    }
    
    convenience init(playerUnits: [CricketPlayerUnit], updated: @escaping () -> ()) {
        self.init(playerUnits: playerUnits)
        self.updated = updated
    }
    
    // MARK: Actions
    func shouldAllowHit(on wedge: Wedge, for score: Score) -> Bool {
        var shouldAllowHit = false
        
        if scores.count == 0 { // this occurs when a score is not associated with a game
            return true
        } else {
            shouldAllowHit = !everyoneClosed(wedge: wedge) && winner == nil
        }
        
        if let activeTurn = activeTurn, shouldAllowHit {
            shouldAllowHit = activeTurn.canAddThrow()
        }
        
        return shouldAllowHit
    }
    
    func shouldAllowScoring(on wedge: Wedge, with multiplier: Multiplier, for score: Score) -> Bool {
        guard shouldAllowHit(on: wedge, for: score) else {
            return false
        }
        
        return !onlyScoreNotClosed(scoreToCheck: score, wedge: wedge)
    }
    
    func hit(on wedge: Wedge, with multiplier: Multiplier, for score: Score) {
        guard shouldAllowHit(on: wedge, for: score) else {
            return
        }
        
        var multiplierForPoints = multiplier
        if !shouldAllowScoring(on: wedge, with: multiplier, for: score) {
            let markDifference = 3 - score.getMarks(for: wedge)
            if markDifference == 1 {
                multiplierForPoints = .single
            }
            if markDifference == 2 {
                multiplierForPoints = .double
            }
            if markDifference == 3 {
                multiplierForPoints = .triple
            }
        }
        
        let dartThrow = DartThrow(wedge: wedge, multiplier: multiplier, score: score)
        let dartThrowForPoints = DartThrow(wedge: wedge, multiplier: multiplierForPoints, score: score)
        
        if var _ = activeTurn {
            self.activeTurn!.add(dartThrow)
            gameActions.push(DartThrowOnTurn(dartThrow: dartThrowForPoints, turn: self.activeTurn!))
        } else {
            gameActions.push(dartThrowForPoints)
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
        if let gameActionToUndo = gameActions.peek() as? DartThrow<CricketScore> {
            gameActionToUndo.undo()
        }
        if var gameActionToUndo = gameActions.peek() as? DartThrowOnTurn<CricketScore> {
            activeTurn = gameActionToUndo.turn.undo()
            gameActionToUndo.undo()
        }
        if let gameActionToUndo = gameActions.peek() as? TurnChange<CricketScore> {
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
extension CricketScoreKeeper {
    var scores: [Score] {
        get {
            var scoresToBeReturned = [Score]()
            for playerUnit in playerUnits {
                scoresToBeReturned.append(playerUnit.score)
            }
            return scoresToBeReturned
        }
    }
    
    func everyoneClosed(wedge: Wedge) -> Bool {
        for score in scores {
            if !score.closed(wedge: wedge) {
                return false
            }
        }
        // If we get here then everyone has closed the wedge
        return true
    }
    
    func onlyScoreNotClosed(scoreToCheck: Score, wedge: Wedge) -> Bool {
        if !scoreToCheck.closed(wedge: wedge) {
            var numberOfScoresClosed = 0
            for score in scores {
                if score.closed(wedge: wedge) {
                    numberOfScoresClosed += 1
                }
            }
            return numberOfScoresClosed == 1
        }
        return false
    }
}
