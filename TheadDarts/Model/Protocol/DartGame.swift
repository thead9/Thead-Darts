//
//  DartGame.swift
//  TheadDarts
//
//  Created by Thomas Headley on 5/21/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

protocol DartGame {
    associatedtype PlayerUnit: DartPlayerUnit
    associatedtype Player: DartPlayer
    associatedtype Score: DartScore
    associatedtype ScoreKeeper: DartScoreKeeper
    
    var playerUnits: [PlayerUnit] { get set }
    var players: [Player] { get }
    var scores: [Score] { get }
    var winner: Player? { get }
    var gameOver: Bool { get }
    
    var scoreKeeper: ScoreKeeper! { get }
    
    func addPlayer(_ player : Player)
}

// MARK: Interacting with Players
extension DartGame {
    
    //MARK: Adding Players
    mutating func addPlayer() {
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
    
    mutating func addPlayer(named name: String) {
        self.addPlayer(Player(name: name))
    }
    
    // MARK: Removing Players
    @discardableResult
    mutating func removePlayer() -> Player {
        return removePlayer(at: playerUnits.count-1)!
    }
    
    @discardableResult
    mutating func removePlayer(at index: Int) -> Player? {
        guard index < players.count && index >= 0 else {
            return nil
        }
        return playerUnits.remove(at: index).player as? Self.Player
    }
    
    // MARK: Modifying Players
    @discardableResult
    mutating func changePlayerName(at index: Int, to name: String) -> Player? {
        guard index < players.count && index >= 0 else {
            return nil
        }
        playerUnits[index].player.name = name
        return players[index]
    }
}
