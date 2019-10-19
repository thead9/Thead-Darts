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
        VStack(alignment: .leading, spacing: 0) {
            Text("Cricket")
                .padding()
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.select(.secondary))
            
            Rectangle()
                .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                .foregroundColor(Color.select(.primary))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Track Turns:")
                        .font(.title)
                    Button(
                        action: { self.settings.trackTurns.toggle() }
                    ) {
                        Text("\(boolToYesNo(settings.trackTurns))")
                            .padding()
                    }
                    .foregroundColor(Color.select(.secondary))
                    .background(Color.select(.hitBackground))
                    .cornerRadius(25)
                    .addBorder(Color.select(.primary), width: 2)
                }
                
                NavigationLink(destination: CricketGameView(cricketGame: CricketGame(numberOfPlayers: 2, trackTurns: settings.trackTurns))) {
                    Text("Start Game")
                        .padding()
                        .font(.largeTitle)
                }
                .foregroundColor(Color.select(.secondary))
                .background(Color.select(.hitBackground))
                .cornerRadius(25)
                .addBorder(Color.select(.primary), width: 2)
                .padding(.top)
            }
            .padding()
        }
        .cornerRadius(25)
        .addBorder(Color.select(.primary), width: 2)
        .padding(.top)
    }

    func boolToYesNo(_ bool: Bool) -> String {
        return bool ? "Yes" : "No"
    }
}

struct CricketCardView_Previews: PreviewProvider {
    static var previews: some View {
        CricketCardView()
    }
}
