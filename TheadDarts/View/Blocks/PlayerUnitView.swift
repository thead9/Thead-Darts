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
    
  @State private var text = ""
  
  var body: some View {
    VStack(spacing: 0) {
      TextField("Name", text: $playerUnitVM.name)
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
        PlayerUnitView(playerUnitVM: PlayerUnitViewModel<CricketScore>(DartPlayerUnit<CricketScore>(player: DartPlayer(name: "Thomas"), score: CricketScore())), startPlayerNameEditing: { _,_ in } )
          .previewLayout(.sizeThatFits)
    }
}
