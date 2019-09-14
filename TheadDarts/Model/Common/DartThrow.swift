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
    
    func toString() -> String {
        if (wedge == .miss) {
            return "\(wedge.rawValue)"
        } else if (wedge == .bull) {
            return "Bx\(multiplier.rawValue)"
        }
        else {
            return "\(wedge.rawValue)x\(multiplier.rawValue)"
        }
    }
}
