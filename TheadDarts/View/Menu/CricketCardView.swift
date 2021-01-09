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
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Bullseye Required")
                        .font(.title)
                        .underline()
                    HStack {
                        Button( action: { withAnimation { self.settings.bullRequired = true } } ) {
                            Text("Yes")
                                .padding()
                                .frame(maxWidth: 100)
                        }
                        .buttonStyle(PrimarySecondaryButtonStyle(isPrimary: self.settings.bullRequired, useScaleEffect: false))
                        Button( action: { withAnimation { self.settings.bullRequired = false } } ) {
                            Text("No")
                                .padding()
                                .frame(maxWidth: 100)
                        }
                        .buttonStyle(PrimarySecondaryButtonStyle(isPrimary: !self.settings.bullRequired, useScaleEffect: false))
                    }
                    .frame(maxWidth: .infinity)
                    
                    Text("Use Points")
                        .font(.title)
                        .underline()
                    HStack {
                        Button( action: { withAnimation { self.settings.usePoints = true } } ) {
                            Text("Yes")
                                .padding()
                                .frame(maxWidth: 100)
                        }
                        .buttonStyle(PrimarySecondaryButtonStyle(isPrimary: self.settings.usePoints, useScaleEffect: false))
                        Button( action: { withAnimation { self.settings.usePoints = false } } ) {
                            Text("No")
                                .padding()
                                .frame(maxWidth: 100)
                        }
                        .buttonStyle(PrimarySecondaryButtonStyle(isPrimary: !self.settings.usePoints, useScaleEffect: false))
                    }
                    .frame(maxWidth: .infinity)
                }
                
                NavigationLink(destination: cricketGameView) {
                    Text("Start Game")
                        .padding()
                        .font(.largeTitle)
                }
                .buttonStyle(SecondaryButtonStyle(useScaleEffect: false))
            }
            .padding()
        }
        .cornerRadius(25)
        .addBorder(Color.select(.primary), width: 2)
        .padding(.top)
    }
  
  var cricketGameView: some View {
      CricketGameView(cricketGameVM: CricketGameViewModel(cricketGame: CricketGame(numberOfPlayers: 2, trackTurns: false /*settings.trackTurns*/, bullRequired: settings.bullRequired, usePoints: settings.usePoints)))
        .ignoresKeyboardSafeArea()
  }
}

struct CricketCardView_Previews: PreviewProvider {
    static var previews: some View {
        CricketCardView()
    }
}
