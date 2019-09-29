//
//  X01PlayerUnitView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/28/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct X01PlayerUnitView: View {
    @ObservedObject var playerUnit: X01PlayerUnit
    
    var body: some View {
        VStack(spacing: 0) {
            Text(self.playerUnit.player.name)
            Text(String(self.playerUnit.score.points))
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        .font(.title)
    }
}

struct X01PlayerUnitView_Previews: PreviewProvider {
    static var previews: some View {
        X01PlayerUnitView(playerUnit: X01PlayerUnit(player: X01Player(name: "Thomas"), score: X01Score()))
            .previewLayout(.fixed(width: 150, height: 100))
    }
}
