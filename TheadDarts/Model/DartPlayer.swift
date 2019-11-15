//
//  DartPlayer.swift
//  TheadDarts
//
//  Created by Thomas Headley on 5/21/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class DartPlayer {
    var updated: () -> () = { }

    var name: String = "Player" {
        didSet {
            updated()
        }
    }
    
    // MARK: Inits
    init() { }
    
    required init(name: String) {
        self.name = name
    }
    
    convenience init(name: String, updated: @escaping () -> ()) {
        self.init(name: name)
        self.updated = updated
    }
}
