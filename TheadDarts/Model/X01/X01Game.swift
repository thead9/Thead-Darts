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
    var winner: X01Player? { get { scoreKeeper.winner } }
    var gameOver: Bool { get { scoreKeeper.gameOver } }
    
    var scoreKeeper: X01ScoreKeeper!
    
    // MARK: Inits
    init(numberOfPlayers: Int) {
        for index in 0..<numberOfPlayers {
            let playerUnit = X01PlayerUnit(player: X01Player(name: "Player \(index+1)"),
                                               score: X01Score(),
                                               updated: { self.objectWillChange.send(()) })
            self.playerUnits.append(playerUnit)
        }
        scoreKeeper = X01ScoreKeeper(playerUnits: self.playerUnits, updated: { self.objectWillChange.send(()) })
        for score in scores {
            score.scoreKeeper = self.scoreKeeper
        }
    }
    
    init(players: [X01Player]) {
        for player in players {
            let playerUnit = X01PlayerUnit(player: player,
                                               score: X01Score(),
                                               updated: { self.objectWillChange.send(()) })
            self.playerUnits.append(playerUnit)
        }
        scoreKeeper = X01ScoreKeeper(playerUnits: self.playerUnits, updated: { self.objectWillChange.send(()) })
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
    var players: [X01Player] {
        get {
            var playersToBeReturned = [X01Player]()
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
        addPlayer(X01Player(name: name))
    }
    
    func addPlayer(_ player : X01Player) {
        playerUnits.append(X01PlayerUnit(player: player, score: X01Score()))
    }
    
    // MARK: Removing Players
    @discardableResult
    func removePlayer() -> X01Player {
        return removePlayer(at: playerUnits.count-1)!
    }
    
    @discardableResult
    func removePlayer(at index: Int) -> X01Player? {
        guard index < players.count && index >= 0 else {
            return nil
        }
        return playerUnits.remove(at: index).player
    }
    
    // MARK: Modifying Players
    @discardableResult
    func changePlayerName(at index: Int, to name: String) -> X01Player? {
        guard index < players.count && index >= 0 else {
            return nil
        }
        playerUnits[index].player.name = name
        return players[index]
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
