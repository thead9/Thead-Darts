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
        
    var body: some View {
        NavigationView {
            VStack {
                cricketCard
                
                x01Card
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationBarTitle(Text("Thead Darts"))
            .foregroundColor(Color("Secondary"))
        }
        .font(.title)
    }
    
    @State var trackTurns: Bool = true
    
    var cricketCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Cricket")
                .padding()
                .font(.largeTitle)
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 2)
                .foregroundColor(Color("Primary"))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Track Turns:")
                    Button(
                        action: { self.trackTurns.toggle() }
                    ) {
                        Text("\(boolToYesNo(trackTurns))")
                            .padding()
                    }
                    .background(Color("HitBackground"))
                    .cornerRadius(25)
                    .addBorder(Color("Primary"), width: 2)
                }
                
                NavigationLink(destination: CricketGameView(cricketGame: CricketGame(numberOfPlayers: 2, trackTurns: self.trackTurns))) {
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
    
    let x01StartingPoints = [501, 401, 301, 201, 101]
    @State var selectingX01StartingPoint = false
    @State var x01StartingPoint = 301
    
    var x01Card: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("X01")
                .padding()
                .font(.largeTitle)
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 2)
                .foregroundColor(Color("Primary"))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Starting Point:")
                    Button(
                        action: { self.selectingX01StartingPoint = true }
                    ) {
                        Text("\(x01StartingPoint)")
                            .padding()
                    }
                    .background(Color("HitBackground"))
                    .cornerRadius(25)
                    .addBorder(Color("Primary"), width: 2)
                }
                
                if selectingX01StartingPoint {
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack {
                            ForEach(x01StartingPoints, id: \.self) { startingPoint in
                                Button(
                                    action: {
                                        self.x01StartingPoint = startingPoint
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
                    })
                }
                
                NavigationLink(destination: CricketGameView(cricketGame: CricketGame(numberOfPlayers: 2, trackTurns: self.trackTurns))) {
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
