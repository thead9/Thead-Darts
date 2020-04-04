//
//  WinnerModal.swift
//  TheadDarts
//
//  Created by Thomas Headley on 11/12/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct WinnerModal: View {
    var canViewScoreboard = true
    
    var winnerName: String
    var newGameAction = { }
    var viewScoreboardAction = { }
    var undoAction = { }
    
    var body: some View {
        VStack {
            Text("\(winnerName) Wins!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Group {
                Button(action: { withAnimation { self.newGameAction() } } ) {
                    Text("New Game")
                        .frame(maxWidth: 250)
                        .padding()
                }
                .padding(.top)
                .buttonStyle(PrimaryButtonStyle())
                
                if canViewScoreboard {
                    Button(action: { withAnimation { self.viewScoreboardAction() } } ) {
                        Text("View Scoreboard")
                            .frame(maxWidth: 250)
                            .padding()
                    }
                    .padding(.top)
                    .buttonStyle(SecondaryButtonStyle(addBorder: false))
                }
                
                Button(action: { withAnimation { self.undoAction() } } ) {
                    Text("Undo")
                        .font(.subheadline)
                        .frame(maxWidth: 250)
                        .padding()
                }
                .padding(.top)
                .buttonStyle(CancelButtonStyle())
            }
        }
        .font(.title)
        .padding()
        .background(Color.select(.background))
        .cornerRadius(25)
    }
}

struct WinnerModal_Previews: PreviewProvider {
    static var previews: some View {
        WinnerModal(winnerName: "Player 1")
    }
}
