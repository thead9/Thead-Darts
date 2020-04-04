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
    
    @State var selectedGameType: GameType = GameType(rawValue: UserSettings().gameType)!
    
    @State var settingsActive = false
        
    // MARK: Body
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    gameTypeSelector
                    gameCard
                    
                    Spacer()
                    
                    settingsControls
                }
                .disabled(settingsActive)
                .blur(radius: settingsActive ? 5 : 0)
                
                if settingsActive {
                    SettingsCardView(settings: settings, doneAction: {
                        self.selectedGameType = GameType(rawValue: self.settings.gameType)!
                        self.settingsActive = false
                    })
                    .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(2)
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
    
    private func select(gameType: GameType) {
        self.settingsActive = false
        self.selectedGameType = gameType
        self.settings.gameType = gameType.rawValue
    }
    
    private var gameTypeSelector: some View {
        Group{
            Text("Select Game Type")
                .padding(.top)
                .font(.largeTitle)
            
            HStack {
                Button(action: { withAnimation { self.select(gameType: .cricket) } } ) {
                    Text("Cricket")
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .font(.largeTitle)
                }
                .buttonStyle(PrimarySecondaryButtonStyle(isPrimary: self.selectedGameType == .cricket))
                
                Button(action: { withAnimation { self.select(gameType: .x01) } } ) {
                    Text("X01")
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .font(.largeTitle)
                }
                .buttonStyle(PrimarySecondaryButtonStyle(isPrimary: self.selectedGameType == .x01))
            }
            .padding(.top)
        }
    }
    
    private var gameCard: some View {
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
    }
    
    private var settingsControls: some View {
        Group {
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
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
