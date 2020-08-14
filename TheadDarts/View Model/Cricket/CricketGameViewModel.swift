//
//  CricketGameViewModel.swift
//  TheadDarts
//
//  Created by Thomas Headley on 11/17/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class CricketGameViewModel: ObservableObject {
    
  var game: CricketGame
  
  @Published var playerUnitVMs: [PlayerUnitViewModel<CricketScore>]
  
  @Published var scores: [CricketScoreViewModel]
  
  var bullRequired: Bool = true
  var showPoints: Bool = true
  
  @Published var gameOver: Bool
  @Published var winnerName: String?
  
  @Published var activeIndex: Int
  @Published var activeTurn: DartTurn<CricketScore>?
    
  init(cricketGame: CricketGame) {
    self.game = cricketGame
    
    bullRequired = cricketGame.bullRequired
    showPoints = cricketGame.usePoints
    
    playerUnitVMs = CricketGameViewModel.playerUnitVMs(playerUnits: game.playerUnits, showPoints: self.showPoints)
    scores = CricketGameViewModel.scores(game: game)
    gameOver = CricketGameViewModel.gameOver(game: game)
    winnerName = CricketGameViewModel.winnerName(game: game)
    activeIndex = CricketGameViewModel.activeIndex(game: game)
    activeTurn = CricketGameViewModel.activeTurn(game: game)
  }
    
  func updateGameState() {
    playerUnitVMs = CricketGameViewModel.playerUnitVMs(playerUnits: game.playerUnits, showPoints: self.showPoints)
    scores = CricketGameViewModel.scores(game: game)
    gameOver = CricketGameViewModel.gameOver(game: game)
    winnerName = CricketGameViewModel.winnerName(game: game)
    activeIndex = CricketGameViewModel.activeIndex(game: game)
    activeTurn = CricketGameViewModel.activeTurn(game: game)
  }
  
  func hit(on wedge: Wedge, with multiplier: Multiplier = .single, for index: Int) {
    game.scores[index].hit(on: wedge, with: multiplier)
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
    
}

extension CricketGameViewModel {
  static func playerUnitVMs(playerUnits: [DartPlayerUnit<CricketScore>], showPoints: Bool) -> [PlayerUnitViewModel<CricketScore>] {
    var playerUnitVMs: [PlayerUnitViewModel<CricketScore>] = []
    for playerUnit in playerUnits {
      playerUnitVMs.append(PlayerUnitViewModel<CricketScore>(playerUnit, showPoints: showPoints))
    }
    return playerUnitVMs
  }
  
  static func scores(game: CricketGame) -> [CricketScoreViewModel] {
    game.scores.map { CricketScoreViewModel(cricketScore: $0, showPoints: game.usePoints) }
  }
  
  static func gameOver(game: CricketGame) -> Bool {
    game.gameOver
  }
  
  static func winnerName(game: CricketGame) -> String? {
    game.winner?.name
  }
  
  static func activeIndex(game: CricketGame) -> Int {
    game.scoreKeeper.activeIndex
  }
  
  static func activeTurn(game: CricketGame) -> DartTurn<CricketScore>? {
    game.scoreKeeper.activeTurn
  }
}
