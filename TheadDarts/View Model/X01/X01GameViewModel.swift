//
//  X01GameViewModel.swift
//  TheadDarts
//
//  Created by Thomas Headley on 11/16/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class X01GameViewModel: ObservableObject {
    
    var game: X01Game
    
    @Published var playerUnits: [PlayerUnitViewModel<X01Score>]
    
    @Published var canAddThrow: Bool
    
    @Published var gameOver: Bool
    @Published var winnerName: String?
    
    @Published var activeIndex: Int
    @Published var activeTurn: DartTurn<X01Score>
    @Published var activeTurnPoints: Int
    
    init(x01Game: X01Game) {
        self.game = x01Game
        
        playerUnits = X01GameViewModel.playerUnitVMs(playerUnits: game.playerUnits)
        canAddThrow = X01GameViewModel.canAddThrow(game: game)
        gameOver = X01GameViewModel.gameOver(game: game)
        winnerName = X01GameViewModel.winnerName(game: game)
        activeIndex = X01GameViewModel.activeIndex(game: game)
        activeTurn = X01GameViewModel.activeTurn(game: game)
        activeTurnPoints = X01GameViewModel.activeTurnPoints(game: game)
    }
    
    func updateGameState() {
        playerUnits = X01GameViewModel.playerUnitVMs(playerUnits: game.playerUnits)
        canAddThrow = X01GameViewModel.canAddThrow(game: game)
        gameOver = X01GameViewModel.gameOver(game: game)
        winnerName = X01GameViewModel.winnerName(game: game)
        activeIndex = X01GameViewModel.activeIndex(game: game)
        activeTurn = X01GameViewModel.activeTurn(game: game)
        activeTurnPoints = X01GameViewModel.activeTurnPoints(game: game)
    }
    
    func hit(on wedge: Wedge, with multiplier: Multiplier = .single) {
        game.scores[activeIndex].hit(on: wedge, with: multiplier)
        updateGameState()
    }
    
    func undo() {
        game.scoreKeeper.undo()
        updateGameState()
    }
    
    func nextPlayer() {
        game.scoreKeeper.nextPlayer()
        updateGameState()
    }
    
    func newGame() {
        game.newGame()
        updateGameState()
    }
    
    
    func updatePlayerUnits() {
        for (index, playerUnit) in playerUnits.enumerated() {
            playerUnit.update(nameTo: game.playerUnits[index].player.name,
                              pointsTo: game.playerUnits[index].score.points)
        }
    }
}

extension X01GameViewModel {
    static func playerUnitVMs(playerUnits: [DartPlayerUnit<X01Score>]) -> [PlayerUnitViewModel<X01Score>] {
        var playerUnitVMs: [PlayerUnitViewModel<X01Score>] = []
        for playerUnit in playerUnits {
            playerUnitVMs.append(PlayerUnitViewModel<X01Score>(playerUnit))
        }
        return playerUnitVMs
    }
    
    static func canAddThrow(game: X01Game) -> Bool {
        game.scoreKeeper.activeTurn.canAddThrow()
    }
    
    static func gameOver(game: X01Game) -> Bool {
        game.gameOver
    }
    
    static func winnerName(game: X01Game) -> String? {
        game.winner?.name
    }
    
    static func activeIndex(game: X01Game) -> Int {
        game.scoreKeeper.activeIndex
    }
    
    static func activeTurn(game: X01Game) -> DartTurn<X01Score> {
        game.scoreKeeper.activeTurn
    }
    
    static func activeTurnPoints(game: X01Game) -> Int {
        game.scores[activeIndex(game: game)].points
    }
}
