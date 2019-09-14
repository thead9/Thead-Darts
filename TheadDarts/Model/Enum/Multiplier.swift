//
//  Multiplier.swift
//  TheadDarts
//
//  Created by Thomas Headley on 6/9/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

enum Multiplier: Int, CaseIterable {
    case single = 1
    case double = 2
    case triple = 3
    
    func name() -> String {
        switch self {
        case .single:
            return "Single"
        case .double:
            return "Double"
        case .triple:
            return "Triple"
        }
    }
}
