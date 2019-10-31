//
//  X01PlayerUnit.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/15/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

import Combine
import SwiftUI

class X01PlayerUnit: DartPlayerUnit, Identifiable, ObservableObject {
    var objectWillChange = PassthroughSubject<Void, Never>()
    var updated: () -> () = { }
    
    var player: X01Player {
        willSet {
            updated()
            objectWillChange.send(())
        }
    }
    var score: X01Score {
        willSet {
            updated()
            objectWillChange.send(())
        }
    }
    let id = UUID()
    
    required init(player: X01Player, score: X01Score) {
        self.player = player
        self.score = score

        self.player.updated = { self.objectWillChange.send(()) }
        self.score.updated = { self.objectWillChange.send(()) }
    }
    
    convenience init(player: X01Player, score: X01Score, updated: @escaping () -> ()) {
        self.init(player: player, score: score)
        self.updated = updated
    }
}
