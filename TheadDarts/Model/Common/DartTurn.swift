//
//  DartTurn.swift
//  TheadDarts
//
//  Created by Thomas Headley on 8/21/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

struct DartTurn<Score: DartScore> {
    var dartThrows: [DartThrow<Score>] = []
    
    mutating func add(_ dartThrow: DartThrow<Score>) {
        guard dartThrows.count < 3 else {
            return
        }
        
        dartThrows.append(dartThrow)
    }
    
    @discardableResult
    mutating func undo() -> DartTurn<Score> {
        guard dartThrows.count != 0 else {
            return DartTurn<Score>()
        }
        
        dartThrows.removeLast()
        
        return self
    }
    
    func canAddThrow() -> Bool {
        if busted {
            return false
        } else {
            return dartThrows.count < 3
        }
    }
    
    var busted: Bool {
        get {
            for dartThrow in dartThrows {
                if dartThrow.bust {
                    return true
                }
            }
            return false
        }
    }
    
    func toString() -> [String] {
        var display = ["T1", "T2", "T3"]
        for (index, dartThrow) in dartThrows.enumerated() {
            display[index] = dartThrow.toString()
        }
        return display
    }
    
    func undoAllThrows() {
        for dartThrow in dartThrows {
            dartThrow.undo()
        }
    }
    
    func redoAllThrows() {
        for dartThrow in dartThrows {
            dartThrow.redo()
        }
    }
}
