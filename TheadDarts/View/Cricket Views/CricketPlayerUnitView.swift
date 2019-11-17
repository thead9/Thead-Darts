//
//  CricketPlayerUnitView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 7/6/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct CricketPlayerUnitView : View {
    @ObservedObject var playerUnitVM: PlayerUnitViewModel<CricketScore>

    var body: some View {
        VStack(spacing: 0) {
            Text(self.playerUnitVM.name)
                .font(.headline)
            Text(String(self.playerUnitVM.points))
                .font(.title)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
    }
}

#if DEBUG
struct CricketPlayerUnitView_Previews : PreviewProvider {
    static var previews: some View {
        CricketPlayerUnitView(playerUnitVM: PlayerUnitViewModel<CricketScore>(DartPlayerUnit(player: DartPlayer(name: "Thomas"), score: CricketScore())))
            .previewLayout(.fixed(width: 150, height: 100))
    }
}
#endif
