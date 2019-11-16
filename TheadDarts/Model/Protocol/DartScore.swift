//
//  DartScore.swift
//  TheadDarts
//
//  Created by Thomas Headley on 5/21/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

protocol DartScore {
    associatedtype Score: DartScore
    associatedtype ScoreKeeper: DartScoreKeeper
    
    var scoreKeeper: ScoreKeeper { get }
    var updated: () -> () { get set }
    
    init()
        
    @discardableResult
    func hit(on wedge: Wedge, with multiplier: Multiplier) -> Score
    
    @discardableResult
    func registerHit(on wedge: Wedge, with multiplier: Multiplier) -> Score
    
    @discardableResult
    func undo(on wedge: Wedge, with multiplier: Multiplier) -> Score
}
