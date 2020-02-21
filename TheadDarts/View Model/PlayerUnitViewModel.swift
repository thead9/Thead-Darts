//
//  PlayerUnitViewModel.swift
//  TheadDarts
//
//  Created by Thomas Headley on 11/16/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

class PlayerUnitViewModel<Score: DartScore>: ObservableObject {
    
    var playerUnit: DartPlayerUnit<Score>
    
    @Published var name: String
    @Published var points: Int
    
    init(_ playerUnit: DartPlayerUnit<Score>) {
        self.playerUnit = playerUnit
        
        self.name = playerUnit.player.name
        self.points = playerUnit.score.points
    }
    
    func update(nameTo newName: String, pointsTo newPoints: Int) {
        name = newName
        playerUnit.player.name = name
        points = newPoints
    }
    
    func update(nameTo newName: String) {
        name = newName
        playerUnit.player.name = name
    }
}
