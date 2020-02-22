//
//  CricketGame.swift
//  TheadDarts
//
//  Created by Thomas Headley on 5/29/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class CricketGame: DartGame {
    typealias Score = CricketScore
        
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
    var scores: [CricketScore] {
        get {
            var scoresToBeReturned = [CricketScore]()
            for playerUnit in playerUnits {
                scoresToBeReturned.append(playerUnit.score)
            }
            return scoresToBeReturned
        }
    }
    
    var bullRequired: Bool = true
    
    var winnerIndex: Int? { get { scoreKeeper.winnerIndex } }
    var winner: DartPlayer? { get { scoreKeeper.winner } }
    var gameOver: Bool { get { scoreKeeper.gameOver } }
    
    var scoreKeeper: CricketScoreKeeper!
    
    // MARK: Inits
    init(numberOfPlayers: Int, trackTurns: Bool = false, bullRequired: Bool = true) {
        for index in 0..<numberOfPlayers {
            let playerUnit = DartPlayerUnit<Score>(player: DartPlayer(name: "Player \(index+1)"),
                                               score: CricketScore())
            self.playerUnits.append(playerUnit)
        }
        
        scoreKeeper = CricketScoreKeeper(playerUnits: self.playerUnits)
        self.bullRequired = bullRequired
        
        if trackTurns {
            scoreKeeper.activeTurn = DartTurn<CricketScore>()
        }
        
        for score in scores {
            score.scoreKeeper = self.scoreKeeper
            score.bullRequired = bullRequired
        }
    }
    
    init(players: [DartPlayer], trackTurns: Bool = false) {
        for player in players {
            let playerUnit = DartPlayerUnit<Score>(player: player,
                                               score: CricketScore())
            self.playerUnits.append(playerUnit)
        }
        scoreKeeper = CricketScoreKeeper(playerUnits: self.playerUnits)
        
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
