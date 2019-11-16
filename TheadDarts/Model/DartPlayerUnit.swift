//
//  DartPlayerUnit.swift
//  TheadDarts
//
//  Created by Thomas Headley on 8/12/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

import Combine
import SwiftUI

class DartPlayerUnit<Score: DartScore>: Identifiable, ObservableObject {
    var objectWillChange = PassthroughSubject<Void, Never>()
    var updated: () -> () = { }
    
    var player: DartPlayer {
        willSet {
            updated()
            objectWillChange.send(())
        }
    }
    var score: Score {
        willSet {
            updated()
            objectWillChange.send(())
        }
    }
    let id = UUID()
    
    required init(player: DartPlayer, score: Score) {
        self.player = player
        self.score = score

        self.player.updated = { self.objectWillChange.send(()) }
        self.score.updated = { self.objectWillChange.send(()) }
    }
    
    convenience init(player: DartPlayer, score: Score, updated: @escaping () -> ()) {
        self.init(player: player, score: score)
        self.updated = updated
    }
}
