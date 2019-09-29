//
//  MainMenuView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/14/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "Secondary") ?? UIColor.black]
    }
    
    @ObservedObject var settings = UserSettings()
        
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(showsIndicators: false) {
                    cricketCard
                      
                    x01Card
                }
            }
            .padding(.horizontal)
            .navigationBarTitle(Text("Thead Darts"))
            .foregroundColor(Color("Secondary"))
        }
        .font(.title)
    }
        
    var cricketCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Cricket")
                .padding()
                .font(.largeTitle)
            
            Rectangle()
                .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                .foregroundColor(Color("Primary"))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Track Turns:")
                    Button(
                        action: { self.settings.trackTurns.toggle() }
                    ) {
                        Text("\(boolToYesNo(settings.trackTurns))")
                            .padding()
                    }
                    .background(Color("HitBackground"))
                    .cornerRadius(25)
                    .addBorder(Color("Primary"), width: 2)
                }
                
                NavigationLink(destination: CricketGameView(cricketGame: CricketGame(numberOfPlayers: 2, trackTurns: settings.trackTurns))) {
                    Text("Start Game")
                        .padding()
                        .font(.largeTitle)
                }
                .background(Color("HitBackground"))
                .cornerRadius(25)
                .addBorder(Color("Primary"), width: 2)
                .padding(.top)
            }
            .padding()
        }
        .cornerRadius(25)
        .addBorder(Color("Primary"), width: 2)
        .padding(.top)
    }
    
    let x01StartingPoints1 = [201, 301, 401, 501]
    let x01StartingPoints2 = [601, 701, 801, 901]
    @State var selectingX01StartingPoint = false
    
    var x01Card: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("X01")
                .padding()
                .font(.largeTitle)
            
            Rectangle()
                .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                .foregroundColor(Color("Primary"))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Starting Point:")
                    Button(
                        action: { self.selectingX01StartingPoint = true }
                    ) {
                        if selectingX01StartingPoint {
                            Text("???")
                                .padding()
                        } else {
                            Text("\(settings.x01StartingPoint)")
                                .padding()
                        }
                    }
                    .background(Color("HitBackground"))
                    .cornerRadius(25)
                    .addBorder(Color("Primary"), width: 2)
                }
                
                if selectingX01StartingPoint {
                    VStack(spacing: 5) {
                        HStack(spacing: 5) {
                            ForEach(x01StartingPoints1, id: \.self) { startingPoint in
                                Button(
                                    action: {
                                        self.settings.x01StartingPoint = startingPoint
                                        self.selectingX01StartingPoint = false
                                    }
                                ) {
                                    Text("\(startingPoint)")
                                        .padding()
                                }
                                .background(Color("HitBackground"))
                                .cornerRadius(25)
                                .addBorder(Color("Primary"), width: 2)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        HStack(spacing: 5) {
                            ForEach(x01StartingPoints2, id: \.self) { startingPoint in
                                Button(
                                    action: {
                                        self.settings.x01StartingPoint = startingPoint
                                        self.selectingX01StartingPoint = false
                                    }
                                ) {
                                    Text("\(startingPoint)")
                                        .padding()
                                }
                                .background(Color("HitBackground"))
                                .cornerRadius(25)
                                .addBorder(Color("Primary"), width: 2)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.top, 5)
                }
                
                HStack {
                    Text("Double Out:")
                    Button(
                        action: { self.settings.doubleOut.toggle() }
                    ) {
                        Text("\(boolToYesNo(settings.doubleOut))")
                            .padding()
                    }
                    .background(Color("HitBackground"))
                    .cornerRadius(25)
                    .addBorder(Color("Primary"), width: 2)
                }
                .padding(.top)
                
                NavigationLink(destination: X01GameView(x01Game: X01Game(numberOfPlayers: 2, startingPoint: settings.x01StartingPoint, doubleOut: settings.doubleOut))) {
                    Text("Start Game")
                        .padding()
                        .font(.largeTitle)
                }
                .background(Color("HitBackground"))
                .cornerRadius(25)
                .addBorder(Color("Primary"), width: 2)
                .padding(.top)
            }
            .padding()
        }
        .cornerRadius(25)
        .addBorder(Color("Primary"), width: 2)
        .padding(.top)
    }
    
    func boolToYesNo(_ bool: Bool) -> String {
        return bool ? "Yes" : "No"
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
