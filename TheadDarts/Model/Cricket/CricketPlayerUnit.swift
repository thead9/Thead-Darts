//
//  PlayerUnit.swift
//  TheadDarts
//
//  Created by Thomas Headley on 7/3/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

import Combine
import SwiftUI

class CricketPlayerUnit: DartPlayerUnit, Identifiable, ObservableObject {    
    var objectWillChange = PassthroughSubject<Void, Never>()
    var updated: () -> () = { }
    
    var player: CricketPlayer {
        willSet {
            updated()
            objectWillChange.send(())
        }
    }
    var score: CricketScore {
        willSet {
            updated()
            objectWillChange.send(())
        }
    }
    let id = UUID()
    
    init(player: CricketPlayer, score: CricketScore) {
        self.player = player
        self.score = score

        self.player.updated = { self.objectWillChange.send(()) }
        self.score.updated = { self.objectWillChange.send(()) }
    }
    
    convenience init(player: CricketPlayer, score: CricketScore, updated: @escaping () -> ()) {
        self.init(player: player, score: score)
        self.updated = updated
    }
}
