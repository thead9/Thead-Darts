//
//  X01Game.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/28/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

import Combine
import SwiftUI

class X01Game: DartGame, ObservableObject {
    var objectWillChange = PassthroughSubject<Void, Never>()

    var playerUnits = [X01PlayerUnit]() {
        willSet {
            objectWillChange.send(())
        }
    }
    
    var winnerIndex: Int? { get { scoreKeeper.winnerIndex } }
    var winner: DartPlayer? { get { scoreKeeper.winner } }
    var gameOver: Bool { get { scoreKeeper.gameOver } }
    
    var scoreKeeper: X01ScoreKeeper!
    
    // MARK: Inits
    init(numberOfPlayers: Int, startingPoint: Int = 301, doubleOut: Bool = true) {
        for index in 0..<numberOfPlayers {
            let playerUnit = X01PlayerUnit(player: DartPlayer(name: "Player \(index+1)"),
                                           score: X01Score(startingPoint: startingPoint),
                                           updated: { self.objectWillChange.send(()) })
            self.playerUnits.append(playerUnit)
        }
        scoreKeeper = X01ScoreKeeper(playerUnits: self.playerUnits,
                                     doubleOut: doubleOut,
                                     updated: { self.objectWillChange.send(()) })
        for score in scores {
            score.scoreKeeper = self.scoreKeeper
        }
    }
    
    init(players: [DartPlayer], startingPoint: Int = 301, doubleOut: Bool = true) {
        for player in players {
            let playerUnit = X01PlayerUnit(player: player,
                                           score: X01Score(startingPoint: startingPoint),
                                           updated: { self.objectWillChange.send(()) })
            self.playerUnits.append(playerUnit)
        }
        scoreKeeper = X01ScoreKeeper(playerUnits: self.playerUnits,
                                     doubleOut: doubleOut,
                                     updated: { self.objectWillChange.send(()) })
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
extension X01Game {
    var players: [DartPlayer] {
        get {
            var playersToBeReturned = [DartPlayer]()
            for playerUnit in playerUnits {
                playersToBeReturned.append(playerUnit.player)
            }
            return playersToBeReturned
        }
    }
    
    // MARK: Adding Players
    func addPlayer(_ player : DartPlayer) {
        playerUnits.append(X01PlayerUnit(player: player, score: X01Score()))
    }
}

// MARK: Score Keeping
extension X01Game {
    var scores: [X01Score] {
        get {
            var scoresToBeReturned = [X01Score]()
            for playerUnit in playerUnits {
                scoresToBeReturned.append(playerUnit.score)
            }
            return scoresToBeReturned
        }
    }
}
