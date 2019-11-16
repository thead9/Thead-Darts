//
//  CricketGame.swift
//  TheadDarts
//
//  Created by Thomas Headley on 5/29/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

import Combine
import SwiftUI

class CricketGame: DartGame, ObservableObject {
    typealias Score = CricketScore
    
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    var playerUnits = [DartPlayerUnit<Score>]() {
        willSet {
            objectWillChange.send(())
        }
    }
    var winnerIndex: Int? { get { scoreKeeper.winnerIndex } }
    var winner: DartPlayer? { get { scoreKeeper.winner } }
    var gameOver: Bool { get { scoreKeeper.gameOver } }
    
    var scoreKeeper: CricketScoreKeeper!
    
    // MARK: Inits
    init(numberOfPlayers: Int, trackTurns: Bool = false) {
        for index in 0..<numberOfPlayers {
            let playerUnit = DartPlayerUnit<Score>(player: DartPlayer(name: "Player \(index+1)"),
                                               score: CricketScore(),
                                               updated: { self.objectWillChange.send(()) })
            self.playerUnits.append(playerUnit)
        }
        
        scoreKeeper = CricketScoreKeeper(playerUnits: self.playerUnits,
                                         updated: { self.objectWillChange.send(()) })
        
        if trackTurns {
            scoreKeeper.activeTurn = DartTurn<CricketScore>()
        }
        
        for score in scores {
            score.scoreKeeper = self.scoreKeeper
        }
    }
    
    init(players: [DartPlayer], trackTurns: Bool = false) {
        for player in players {
            let playerUnit = DartPlayerUnit<Score>(player: player,
                                               score: CricketScore(),
                                               updated: { self.objectWillChange.send(()) })
            self.playerUnits.append(playerUnit)
        }
        scoreKeeper = CricketScoreKeeper(playerUnits: self.playerUnits,
                                         updated: { self.objectWillChange.send(()) })
        
        if trackTurns {
            scoreKeeper.activeTurn = DartTurn<CricketScore>()
        }
        
        for score in scores {
            score.scoreKeeper = self.scoreKeeper
        }
    }
    
    func newGame() {
        for playerUnit in playerUnits {
            playerUnit.score.reset()
        }
        scoreKeeper.reset()
    }
}

// MARK: Interacting with Players
extension CricketGame {
    var players: [DartPlayer] {
        get {
            var playersToBeReturned = [DartPlayer]()
            for playerUnit in playerUnits {
                playersToBeReturned.append(playerUnit.player)
            }
            return playersToBeReturned
        }
    }
    
    func addPlayer(_ player : DartPlayer) {
        playerUnits.append(DartPlayerUnit<Score>(player: player, score: CricketScore()))
    }
}

// MARK: Score Keeping
extension CricketGame {
    var scores: [CricketScore] {
        get {
            var scoresToBeReturned = [CricketScore]()
            for playerUnit in playerUnits {
                scoresToBeReturned.append(playerUnit.score)
            }
            return scoresToBeReturned
        }
    }
}
