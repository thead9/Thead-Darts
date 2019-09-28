//
//  DartThrowOnTurn.swift
//  TheadDarts
//
//  Created by Thomas Headley on 8/22/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

struct DartThrowOnTurn<Score: DartScore>: DartAction {
    let dartThrow: DartThrow<Score>
    var turn: DartTurn<Score>
    
    func undo() {
        dartThrow.undo()
    }
}
