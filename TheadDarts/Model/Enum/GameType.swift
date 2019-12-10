//
//  GameType.swift
//  TheadDarts
//
//  Created by Thomas Headley on 12/9/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

enum GameType: String {
    case cricket
    case x01
    case none
    
    func toString() -> String {
        return self.rawValue
    }
}
