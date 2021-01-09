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
  @Binding var isEditingName: Bool
  
  var body: some View {
    VStack(spacing: 0) {
      TextField("Name...", text: $playerUnitVM.name, onEditingChanged: { isEditing in
        isEditingName = isEditing
      })
        .textFieldStyle(PlainTextFieldStyle())
        .multilineTextAlignment(.center)
        .padding(.horizontal)
      
      if playerUnitVM.showPoints {
        Text(String(playerUnitVM.points))
          .font(.title)
      }
    }
  }
}

struct PlayerUnitView_Previews: PreviewProvider {
    static var previews: some View {
      PlayerUnitView(playerUnitVM: PlayerUnitViewModel<CricketScore>(DartPlayerUnit<CricketScore>(player: DartPlayer(name: "Thomas"), score: CricketScore())), isEditingName: .constant(false))
          .previewLayout(.sizeThatFits)
    }
}
