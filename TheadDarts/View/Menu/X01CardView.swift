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
        VStack(alignment: .leading, spacing: 0) {
            Text("X01")
                .padding()
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.select(.secondary))
            
            Rectangle()
                .frame(minHeight: 2, maxHeight: 2)
                .foregroundColor(Color.select(.primary))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Starting Point:")
                        .font(.title)
                    Button(action: {
                        withAnimation {
                            self.selectingX01StartingPoint.toggle()
                        }
                    }) {
                        Text("\(settings.x01StartingPoint)")
                            .padding()
                    }
                    .buttonStyle(SecondaryButtonStyle())
                }
                
                if selectingX01StartingPoint {
                    startingPointGrid
                        .transition(.slideInFadeUp)
                        .padding(.top, 3)
                }
                
                HStack {
                    Text("Double Out:")
                        .font(.title)
                    Button(
                        action: { self.settings.doubleOut.toggle() }
                    ) {
                        Text("\(boolToYesNo(settings.doubleOut))")
                            .padding()
                    }
                    .buttonStyle(SecondaryButtonStyle())
                }
                .padding(.top)
                
                NavigationLink(destination: X01GameView(x01Game: X01Game(numberOfPlayers: 2, startingPoint: settings.x01StartingPoint, doubleOut: settings.doubleOut))) {
                    Text("Start Game")
                        .padding()
                        .font(.largeTitle)
                }
                .buttonStyle(SecondaryButtonStyle())
                .padding(.top)
            }
            .padding()
        }
        .cornerRadius(25)
        .addBorder(Color.select(.primary), width: 2)
        .padding(.top)
    }
    
    // MARK: Starting Point Grid
    @State var selectingX01StartingPoint = false

    let startingPointArray: [[Int]] = [[101, 201, 301],
                                       [401, 501, 601],
                                       [701, 801, 901]]
    
    var startingPointGrid: some View {
        VStack(spacing: 5) {
            ForEach(0..<self.startingPointArray.count, id: \.self) { rowIndex in
                HStack(spacing: 5) {
                    ForEach(self.startingPointArray[rowIndex], id: \.self) { startingPoint in
                        Button( action: {
                            withAnimation {
                                self.settings.x01StartingPoint = startingPoint
                                self.selectingX01StartingPoint.toggle()
                            }
                        }) {
                            Text("\(startingPoint)")
                                .padding()
                                .frame(maxWidth: 200)
                        }
                        .buttonStyle(SecondaryButtonStyle())
                    }
                }
            }
        }
    }
    
    func boolToYesNo(_ bool: Bool) -> String {
        return bool ? "Yes" : "No"
    }
}

struct X01CardView_Previews: PreviewProvider {
    static var previews: some View {
        X01CardView()
    }
}
