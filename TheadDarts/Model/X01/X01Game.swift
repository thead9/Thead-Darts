//
//  X01Game.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/28/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class X01Game: DartGame {
    typealias Score = X01Score
    
    var playerUnits = [DartPlayerUnit<Score>]()
    var players: [DartPlayer] {
        get {
            var playersToBeReturned = [DartPlayer]()
            for playerUnit in playerUnits {
                playersToBeReturned.append(playerUnit.player)
            }
            return playersToBeReturned
        }
    }
    var scores: [X01Score] {
        get {
            var scoresToBeReturned = [X01Score]()
            for playerUnit in playerUnits {
                scoresToBeReturned.append(playerUnit.score)
            }
            return scoresToBeReturned
        }
    }
    
    var winnerIndex: Int? { get { scoreKeeper.winnerIndex } }
    var winner: DartPlayer? { get { scoreKeeper.winner } }
    var gameOver: Bool { get { scoreKeeper.gameOver } }
    
    var scoreKeeper: X01ScoreKeeper!
    
    // MARK: Inits
    init(numberOfPlayers: Int, startingPoint: Int = 301, doubleOut: Bool = true) {
        for index in 0..<numberOfPlayers {
            let playerUnit = DartPlayerUnit<Score>(player: DartPlayer(name: "Player \(index+1)"),
                                           score: X01Score(startingPoint: startingPoint))
            self.playerUnits.append(playerUnit)
        }
        scoreKeeper = X01ScoreKeeper(playerUnits: self.playerUnits,
                                     doubleOut: doubleOut)
        for score in scores {
            score.scoreKeeper = self.scoreKeeper
        }
    }
    
    init(players: [DartPlayer], startingPoint: Int = 301, doubleOut: Bool = true) {
        for player in players {
            let playerUnit = DartPlayerUnit<Score>(player: player,
                                           score: X01Score(startingPoint: startingPoint))
            self.playerUnits.append(playerUnit)
        }
        scoreKeeper = X01ScoreKeeper(playerUnits: self.playerUnits,
                                     doubleOut: doubleOut)
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
