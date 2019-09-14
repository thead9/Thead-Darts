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
    var scores: [Score] { get }
    var winner: Player? { get }
    var gameOver: Bool { get }
    
    var scoreKeeper: ScoreKeeper! { get }
}
