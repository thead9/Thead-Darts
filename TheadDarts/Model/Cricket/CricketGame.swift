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
    var usePoints: Bool = true
    
    var winnerIndex: Int? { get { scoreKeeper.winnerIndex } }
    var winner: DartPlayer? { get { scoreKeeper.winner } }
    var gameOver: Bool { get { scoreKeeper.gameOver } }
    
    var scoreKeeper: CricketScoreKeeper!
    
    // MARK: Inits
    convenience init(numberOfPlayers: Int, trackTurns: Bool = false, bullRequired: Bool = true, usePoints: Bool = true) {
        var dartPlayers = [DartPlayer]()
        for index in 0..<numberOfPlayers {
            dartPlayers.append(DartPlayer(name: "Player \(index+1)"))
        }
        
        self.init(players: dartPlayers, trackTurns: trackTurns, bullRequired: bullRequired, usePoints: usePoints)
    }
    
    init(players: [DartPlayer], trackTurns: Bool = false, bullRequired: Bool = true, usePoints: Bool = true) {
        for player in players {
            let playerUnit = DartPlayerUnit<Score>(player: player,
                                               score: CricketScore())
            self.playerUnits.append(playerUnit)
        }
        
        self.bullRequired = bullRequired
        self.usePoints = usePoints
        
        scoreKeeper = CricketScoreKeeper(playerUnits: self.playerUnits, trackTurns: trackTurns, usePoints: usePoints)
        
        for score in scores {
            score.scoreKeeper = self.scoreKeeper
            score.bullRequired = bullRequired
        }
    }
    
    func newGame() {
        for playerUnit in playerUnits {
            playerUnit.score.reset()
        }
        scoreKeeper.reset()
    }
}
