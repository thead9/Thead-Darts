//
//  MainMenuView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/14/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var settings = UserSettings()
    
    @State var selectedGameType: GameType = GameType(rawValue: UserSettings().gameType)
    
    @State var settingsActive = false
        
    // MARK: Body
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Select Game Type")
                    .padding(.top)
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
                    // Ideally this would be converted to a ternary style selection, but it doesn't compile???
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
                    // Ideally this would be converted to a ternary style selection, but it doesn't compile???
                    .foregroundColor(self.selectedGameType == .x01 ? Color.select(.background) : Color.select(.secondary))
                    .background(self.selectedGameType == .x01 ? Color.select(.secondary) : Color.select(.hitBackground))
                    .cornerRadius(25)
                }
                .padding(.vertical)
                
                Group {
                    if self.selectedGameType == .cricket {
                        CricketCardView()
                            .transition(.slideAndFade)
                            .frame(maxWidth: 500)
                    }
                    
                    if self.selectedGameType == .x01 {
                        X01CardView()
                            .transition(.slideAndFade)
                            .frame(maxWidth: 500)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
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
                        .buttonStyle(SecondaryButtonStyle())
                    
                    }
                    .padding(.bottom)
                } else {
                    Group {
                        settingsCard
                            .transition(.move(edge: .bottom))
                            .frame(maxWidth: 500)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
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
                .textStyle(CardTitleTextStyle(backgroundColor: Color.select(.secondary)))
            
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
                .buttonStyle(SecondaryButtonStyle())
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
                        .buttonStyle(SecondaryButtonStyle(foregroundColor: Color.getColorNamed(theme.rawValue), useScaleEffect: false))
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
