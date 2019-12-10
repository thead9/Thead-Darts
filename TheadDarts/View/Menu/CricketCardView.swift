//
//  CricketCardView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 10/19/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct CricketCardView: View {
    
    @ObservedObject var settings = UserSettings()

    // MARK: Body
    var body: some View {
        CardView(title: "Cricket") {
            VStack(alignment: .leading) {
                HStack {
                    Text("Track Turns:")
                        .font(.title)
                    Button(
                        action: { self.settings.trackTurns.toggle() }
                    ) {
                        Text("\(settings.trackTurns.toYesNo())")
                            .padding()
                    }
                    // Can't use scaleEffect because of bug
                    .buttonStyle(SecondaryButtonStyle(useScaleEffect: false))
                }
                
                NavigationLink(destination: CricketGameView(cricketGameVM: CricketGameViewModel(cricketGame: CricketGame(numberOfPlayers: 2, trackTurns: settings.trackTurns)))) {
                    Text("Start Game")
                        .padding()
                        .font(.largeTitle)
                }
                // Can't use scaleEffect because of bug
                .buttonStyle(SecondaryButtonStyle(useScaleEffect: false))
                .padding(.top)
            }
            .padding()
        }
        .cornerRadius(25)
        .addBorder(Color.select(.primary), width: 2)
        .padding(.top)
    }
}

struct CricketCardView_Previews: PreviewProvider {
    static var previews: some View {
        CricketCardView()
    }
}
