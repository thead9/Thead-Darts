//
//  ScoreView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 12/8/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct PlayerUnitView<Score: DartScore>: View {
    @ObservedObject var playerUnitVM: PlayerUnitViewModel<Score>
    
    let startPlayerNameEditing: (String, @escaping (String) -> ()) -> ()
        
    var body: some View {
        Button(action: { withAnimation {
            self.startPlayerNameEditing(self.playerUnitVM.name, self.playerUnitVM.update(nameTo:)) }
        }) {
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
}

struct PlayerUnitView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerUnitView(playerUnitVM: PlayerUnitViewModel<CricketScore>(DartPlayerUnit<CricketScore>(player: DartPlayer(name: "Thomas"), score: CricketScore())), startPlayerNameEditing: { _,_ in } )
    }
}