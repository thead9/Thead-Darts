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
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    var playerUnits = [CricketPlayerUnit]() {
        willSet {
            objectWillChange.send(())
        }
    }
    var winnerIndex: Int? { get { scoreKeeper.winnerIndex } }
    var winner: CricketPlayer? { get { scoreKeeper.winner } }
    var gameOver: Bool { get { scoreKeeper.gameOver } }
    
    var scoreKeeper: CricketScoreKeeper!
    
    // MARK: Inits
    init(numberOfPlayers: Int) {
        for index in 0..<numberOfPlayers {
            let playerUnit = CricketPlayerUnit(player: CricketPlayer(name: "Player \(index+1)"),
                                               score: CricketScore(),
                                               updated: { self.objectWillChange.send(()) })
            self.playerUnits.append(playerUnit)
        }
        scoreKeeper = CricketScoreKeeper(playerUnits: self.playerUnits, updated: { self.objectWillChange.send(()) })
        for score in scores {
            score.scoreKeeper = self.scoreKeeper
        }
    }
    
    init(players: [CricketPlayer]) {
        for player in players {
            let playerUnit = CricketPlayerUnit(player: player,
                                               score: CricketScore(),
                                               updated: { self.objectWillChange.send(()) })
            self.playerUnits.append(playerUnit)
        }
        scoreKeeper = CricketScoreKeeper(playerUnits: self.playerUnits, updated: { self.objectWillChange.send(()) })
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
    var players: [CricketPlayer] {
        get {
            var playersToBeReturned = [CricketPlayer]()
            for playerUnit in playerUnits {
                playersToBeReturned.append(playerUnit.player)
            }
            return playersToBeReturned
        }
    }
    
    // MARK: Adding Players
    func addPlayer() {
        func getDefaultNewPlayerName() -> String {
            var biggestDefaultPlayerName = 1
            for player in players {
                if player.name.contains("Player") {
                    let nameArray = player.name.components(separatedBy: " ")
                    if let currentNumber = Int(nameArray.last!) {
                        if biggestDefaultPlayerName < currentNumber {
                            biggestDefaultPlayerName = currentNumber
                        }
                    }
                }
            }
            
            var newPlayerNameNumber = 1
            if biggestDefaultPlayerName < players.count {
                newPlayerNameNumber = players.count
            } else {
                newPlayerNameNumber = biggestDefaultPlayerName
            }
            return "Player \(newPlayerNameNumber+1)"
        }
        addPlayer(named: getDefaultNewPlayerName())
    }
    
    func addPlayer(named name: String) {
        addPlayer(CricketPlayer(name: name))
    }
    
    func addPlayer(_ player : CricketPlayer) {
        playerUnits.append(CricketPlayerUnit(player: player, score: CricketScore()))
    }
    
    // MARK: Removing Players
    @discardableResult
    func removePlayer() -> CricketPlayer {
        return removePlayer(at: playerUnits.count-1)!
    }
    
    @discardableResult
    func removePlayer(at index: Int) -> CricketPlayer? {
        guard index < players.count && index >= 0 else {
            return nil
        }
        return playerUnits.remove(at: index).player
    }
    
    // MARK: Modifying Players
    @discardableResult
    func changePlayerName(at index: Int, to name: String) -> CricketPlayer? {
        guard index < players.count && index >= 0 else {
            return nil
        }
        playerUnits[index].player.name = name
        return players[index]
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
