//
//  TurnChange.swift
//  TheadDarts
//
//  Created by Thomas Headley on 8/13/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

struct TurnChange<Score: DartScore>: DartAction {
    let oldActiveIndex: Int
    let oldTurn: DartTurn<Score>
    let newActiveIndex: Int
}
