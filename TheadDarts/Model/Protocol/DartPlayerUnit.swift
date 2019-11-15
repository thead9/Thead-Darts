//
//  DartPlayerUnit.swift
//  TheadDarts
//
//  Created by Thomas Headley on 8/12/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

protocol DartPlayerUnit {
    associatedtype Score: DartScore
    
    var player: DartPlayer { get set }
    var score: Score { get set }
    
    init(player: DartPlayer, score: Score)
}
