//
//  X01PlayerUnitView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/28/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct X01PlayerUnitView: View {
    @ObservedObject var playerUnitVM: PlayerUnitViewModel<X01Score>
    
    var body: some View {
        VStack(spacing: 0) {
            Text(self.playerUnitVM.name)
                .font(.headline)
            Text(String(self.playerUnitVM.points))
                .font(.title)
        }
        .lineLimit(1)
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    
}

struct X01PlayerUnitView_Previews: PreviewProvider {
    static var previews: some View {
        X01PlayerUnitView(playerUnitVM: PlayerUnitViewModel<X01Score>(DartPlayerUnit(player: DartPlayer(name: "Thomas"), score: X01Score())))
            .previewLayout(.fixed(width: 150, height: 100))
    }
}


