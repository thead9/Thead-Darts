//
//  DartPlayer.swift
//  TheadDarts
//
//  Created by Thomas Headley on 5/21/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

protocol DartPlayer {
    var name: String { get set }
    
    init(name: String)
}
