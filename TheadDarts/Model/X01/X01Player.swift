//
//  X01Player.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/15/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class X01Player: DartPlayer {
    var updated: () -> () = { }

    var name: String = "Player" {
        didSet {
            updated()
        }
    }
    
    // MARK: Inits
    init() { }
    
    init(name: String) {
        self.name = name
    }
    
    convenience init(name: String, updated: @escaping () -> ()) {
        self.init(name: name)
        self.updated = updated
    }
}
