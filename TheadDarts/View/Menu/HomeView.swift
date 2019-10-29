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
    
    @State var selectedGameType: GameType = GameType(rawValue: UserSettings().gameType)
    
    @State var settingsActive = false
        
    // MARK: Body
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Select Game Type")
                    .font(.largeTitle)
                
                HStack {
                    Button(action: {
                        withAnimation {
                            self.settingsActive = false
                            self.selectedGameType = GameType.cricket
                            self.settings.gameType = GameType.cricket.rawValue
                        }
                    }) {
                        Text("Cricket")
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .font(.largeTitle)
                    }
                    .foregroundColor(self.selectedGameType == .cricket ? Color.select(.background) : Color.select(.secondary))
                    .background(self.selectedGameType == .cricket ? Color.select(.secondary) : Color.select(.hitBackground))
                    .cornerRadius(25)
                    
                    Button(action: {
                        withAnimation {
                            self.settingsActive = false
                            self.selectedGameType = .x01
                            self.settings.gameType = GameType.x01.rawValue
                        }
                    }) {
                        Text("X01")
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .font(.largeTitle)
                    }
                    .foregroundColor(self.selectedGameType == .x01 ? Color.select(.background) : Color.select(.secondary))
                    .background(self.selectedGameType == .x01 ? Color.select(.secondary) : Color.select(.hitBackground))
                    .cornerRadius(25)
                }
                .padding(.vertical)
                
                if self.selectedGameType == .cricket {
                    CricketCardView()
                        .transition(.slideAndFade)
                }
                
                if self.selectedGameType == .x01 {
                    X01CardView()
                        .transition(.slideAndFade)
                }
                
                Spacer()
                
                if !self.settingsActive {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            withAnimation {
                                self.selectedGameType = GameType.none
                                self.settingsActive = true
                            }
                        }) {
                            Image(systemName: "gear")
                                .padding()
                                .font(.title)
                        }
                        .foregroundColor(Color.select(.secondary))
                        .background(Color.select(.hitBackground))
                        .cornerRadius(25)
                        .addBorder(Color.select(.primary), width: 2)
                    }
                    .padding(.bottom)
                } else {
                    settingsCard
                        .transition(.move(edge: .bottom))
                }
            }
            .addBorder(Color(.clear), width: 0.0, condition: settings.theme == "clear")
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity)
            .navigationBarTitle(Text("Thead Darts"))
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .font(.headline)
    }
    
    // MARK: Theme
    var settingsCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Settings")
                .padding()
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.select(.secondary))
            
            Rectangle()
                .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                .foregroundColor(Color.select(.primary))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Theme:")
                        .font(.title)
                    Text("\(self.settings.theme)")
                        .padding()
                        .foregroundColor(Color.select(.secondary))
                        .background(Color.select(.hitBackground))
                        .cornerRadius(25)
                        .addBorder(Color.select(.primary), width: 2)
                }
                
                themeGrid
                    .transition(.slideInFadeUp)
                    .padding(.top)
                
                Button(action: {
                    withAnimation {
                        self.selectedGameType = GameType(rawValue: self.settings.gameType)
                        self.settingsActive = false
                    }
                }) {
                    Text("Done")
                        .padding()
                        .font(.title)
                }
                .foregroundColor(Color.select(.secondary))
                .background(Color.select(.hitBackground))
                .cornerRadius(25)
                .addBorder(Color.select(.primary), width: 2)
                .padding(.top)
            }
            .padding()
        }
        .navigationBarHidden(false)
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

enum GameType: String {
    case cricket
    case x01
    case none
    
    func toString() -> String {
        return self.rawValue
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
