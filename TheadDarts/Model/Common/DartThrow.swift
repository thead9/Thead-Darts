//
//  DartToss.swift
//  TheadDarts
//
//  Created by Thomas Headley on 8/13/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

struct DartThrow<Score: DartScore>: DartAction {
    let wedge: Wedge
    let multiplier: Multiplier
    let score: Score
    let bust: Bool
    
    init (wedge: Wedge, multiplier: Multiplier, score: Score, bust: Bool = false) {
        self.wedge = wedge
        self.multiplier = multiplier
        self.score = score
        self.bust = bust
    }
        
    func toString() -> String {
        if bust {
            if wedge == .bull {
                return "Bust (Bx\(multiplier.rawValue))"
            } else {
                return "Bust (\(wedge.rawValue)x\(multiplier.rawValue))"
            }
        }
        if wedge == .miss {
            return "\(wedge.rawValue)"
        } else if wedge == .bull {
            return "Bx\(multiplier.rawValue)"
        }
        else {
            return "\(wedge.rawValue)x\(multiplier.rawValue)"
        }
    }

    func undo() {
        guard !bust else {
            return
        }
        
        score.undo(on: wedge, with: multiplier)
    }
    
    func redo() {
        score.registerHit(on: wedge, with: multiplier)
    }
}
