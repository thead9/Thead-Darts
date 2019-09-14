//
//  CricketPlayerUnitView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 7/6/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct CricketPlayerUnitView : View {
    @ObservedObject var playerUnit: CricketPlayerUnit
    
    var body: some View {
        VStack(spacing: 0) {
            Text(self.playerUnit.player.name)
            Text(String(self.playerUnit.score.points))
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        .font(.title)
    }
}

#if DEBUG
struct CricketPlayerUnitView_Previews : PreviewProvider {
    static var previews: some View {
        CricketPlayerUnitView(playerUnit: CricketPlayerUnit(player: CricketPlayer(name: "Thomas"), score: CricketScore()))
            .previewLayout(.fixed(width: 150, height: 100))
    }
}
#endif
