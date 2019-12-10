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
                .padding(.top)
                
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
                        SettingsCardView(doneAction: {
                            self.selectedGameType = GameType(rawValue: self.settings.gameType)
                            self.settingsActive = false
                        })
                            .transition(.move(edge: .bottom))
                            .frame(maxWidth: 500)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity)
            .navigationBarTitle(Text("Thead Darts"))
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .font(.headline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
