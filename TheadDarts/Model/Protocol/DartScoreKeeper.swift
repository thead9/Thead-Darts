//
//  DartScoreKeeper.swift
//  TheadDarts
//
//  Created by Thomas Headley on 6/29/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

protocol DartScoreKeeper {
    associatedtype Player: DartPlayer
    associatedtype Score: DartScore

    var playerUnits: [DartPlayerUnit<Score>] { get }
    var gameActions: Stack<DartAction> { get set }
    var winner: Player? { get }
    var gameOver: Bool { get }
    
    func hit(on wedge: Wedge, with multiplier: Multiplier, for score: Score)
}
