//
//  DartPlayer.swift
//  TheadDarts
//
//  Created by Thomas Headley on 5/21/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class DartPlayer {
    var name: String = "Player"
    
    // MARK: Inits
    init() { }
    
    required init(name: String) {
        self.name = name
    }
}
