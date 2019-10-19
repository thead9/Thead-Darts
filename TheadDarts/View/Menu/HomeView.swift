//
//  MainMenuView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/14/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "Secondary") ?? UIColor.black]
//    }
    
    @ObservedObject var settings = UserSettings()
        
    // MARK: Body
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(showsIndicators: false) {
                    EncapsulatedView() // This is needed to allow for animations in ScrollView
                }
            }
            .padding(.horizontal)
            .navigationBarTitle(Text("Thead Darts"))
            .navigationBarHidden(true)
        }
        .font(.headline)
    }
        
    // This is needed to allow for animations in ScrollView
    struct EncapsulatedView: View {
        @ObservedObject var settings = UserSettings()
        
        var body: some View {
            VStack {
                cricketCard
                  
                X01CardView()
                
                settingsCard
            }
        }
        
        // MARK: Cricket
        var cricketCard: some View {
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
        
        // MARK: Settings
        @State var selectingTheme = false
        
        var settingsCard: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text("Settings")
                    .padding()
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.select(.hitBackground))
                
                Rectangle()
                    .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                    .foregroundColor(Color.select(.primary))
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Theme:")
                            .font(.title)
                        Button(action: {
                            withAnimation {
                                self.selectingTheme.toggle()
                            }
                        }) {
                            Text("\(self.settings.theme)")
                                .padding()
                        }
                        .foregroundColor(Color.select(.secondary))
                        .background(Color.select(.hitBackground))
                        .cornerRadius(25)
                        .addBorder(Color.select(.primary), width: 2)
                    }
                    
                    if selectingTheme {
                        themeGrid
                            .transition(.slideInFadeAway)
                            .padding(.top, 3)
                    }
                }
                .padding()
            }
            .cornerRadius(25)
            .addBorder(Color.select(.primary), width: 2)
            .padding(.top)
        }
        
        let themeArray: [[UserSettings.Theme]] = [[.blue, .green, .indigo],
                                                  [.orange, .pink, .purple],
                                                  [.red, .teal, .yellow]]
        
        var themeGrid: some View {
            VStack(spacing: 5) {
                ForEach(0..<self.themeArray.count, id: \.self) { rowIndex in
                    HStack(spacing: 5) {
                        ForEach(self.themeArray[rowIndex], id: \.self) { theme in
                            Button( action: {
                                withAnimation {
                                    self.settings.theme = theme.rawValue
                                    self.selectingTheme.toggle()
                                }
                            }) {
                                Text("\(theme.rawValue)")
                                    .padding()
                                    .font(.headline)
                                    .frame(maxWidth: 150)
                            }
                            .background(Color.select(.hitBackground))
                            .foregroundColor(Color.getColorNamed(theme.rawValue))
                            .cornerRadius(25)
                            .addBorder(Color.select(.primary), width: 2)
                        }
                    }
                }
            }
        }
        
        func boolToYesNo(_ bool: Bool) -> String {
            return bool ? "Yes" : "No"
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
