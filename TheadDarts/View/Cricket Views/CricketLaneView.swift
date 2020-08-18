//
//  CricketLaneView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 8/17/20.
//  Copyright © 2020 Thead. All rights reserved.
//

import SwiftUI

struct CricketLaneView<Score: DartScore>: View {
  @ObservedObject var playerUnitVM: PlayerUnitViewModel<Score>
  @ObservedObject var scoreVM: CricketScoreViewModel
  var isWholeViewDisabled: Bool
  let onHit: () -> ()
  let startPlayerNameEditing: (String, @escaping (String) -> ()) -> ()

  var body: some View {
    VStack {
      PlayerUnitView(playerUnitVM: playerUnitVM,
                     startPlayerNameEditing: startPlayerNameEditing)
      
      CricketHitView(scoreVM: scoreVM, onHit: onHit, wholeViewDisabled: isWholeViewDisabled)
    }
  }
}

struct CricketLaneView_Previews: PreviewProvider {
    static var previews: some View {
      CricketLaneView(playerUnitVM: PlayerUnitViewModel(DartPlayerUnit(player: DartPlayer(name: "Test"), score: CricketScore())), scoreVM: CricketScoreViewModel(cricketScore: CricketScore()), isWholeViewDisabled: false, onHit: { }, startPlayerNameEditing: {_, _ in })
        .previewLayout(.sizeThatFits)
    }
}
