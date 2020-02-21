//
//  X01CardView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 10/12/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct X01CardView: View {
    
    @ObservedObject var settings = UserSettings()
        
    // MARK: Body
    var body: some View {
        CardView(title: "X01") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Starting Point")
                        .font(.title)
                        .underline()
                    startingPointGrid
                        .frame(maxWidth: .infinity)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Double Out")
                        .font(.title)
                        .underline()
                    HStack {
                        Button( action: { withAnimation { self.settings.doubleOut = true } } ) {
                            Text("Yes")
                                .padding()
                                .frame(maxWidth: 100)
                        }
                        .buttonStyle(PrimarySecondaryButtonStyle(isPrimary: self.settings.doubleOut, useScaleEffect: false))
                        Button( action: { withAnimation { self.settings.doubleOut = false } } ) {
                            Text("No")
                                .padding()
                                .frame(maxWidth: 100)
                        }
                        .buttonStyle(PrimarySecondaryButtonStyle(isPrimary: !self.settings.doubleOut, useScaleEffect: false))
                    }
                    .frame(maxWidth: .infinity)
                }
                
                NavigationLink(destination: X01GameView(x01GameVM: X01GameViewModel(x01Game: X01Game(numberOfPlayers: 2, startingPoint: self.settings.x01StartingPoint)))) {
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
    
    // MARK: Starting Point Grid
    let startingPointArray: [[Int]] = [[101, 201, 301],
                                       [401, 501, 601],
                                       [701, 801, 901]]
    
    var startingPointGrid: some View {
        VStack(spacing: 5) {
            ForEach(0..<self.startingPointArray.count, id: \.self) { rowIndex in
                HStack(spacing: 5) {
                    ForEach(self.startingPointArray[rowIndex], id: \.self) { startingPoint in
                        Button( action: { withAnimation { self.settings.x01StartingPoint = startingPoint } }) {
                            Text("\(startingPoint)")
                                .padding()
                                .frame(maxWidth: 100)
                        }
                        .buttonStyle(PrimarySecondaryButtonStyle(isPrimary: self.settings.x01StartingPoint == startingPoint, useScaleEffect: false))
                    }
                }
            }
        }
    }
}

struct X01CardView_Previews: PreviewProvider {
    static var previews: some View {
        X01CardView()
    }
}
