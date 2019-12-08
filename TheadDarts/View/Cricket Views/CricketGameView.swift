//
//  ContentView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 7/1/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct CricketGameView : View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @ObservedObject var cricketGameVM: CricketGameViewModel
    
    @State var showNewGameModal = false
    @State var showWinnerModal = false
            
    // MARK: Body
    let leftColumnWidth: CGFloat = 50

    var body: some View {
        ZStack {
            VStack {
                scoreboard
                
                turnControls
                    .padding(.bottom, 2)
                
                bottomControls
            }
            .font(.title)
            .padding(.vertical)
            .zIndex(1)
            .disabled(showNewGameModal || showWinnerModal)
            .blur(radius: showNewGameModal || showWinnerModal ? 5 : 0)
            
            if showNewGameModal {
                NewGameModal(affirmativeAction: {
                                self.cricketGameVM.newGame()
                                self.showNewGameModal = false
                             },
                             cancelAction: {
                                self.showNewGameModal = false})
                    .padding()
                    .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(2)
            }
            
            if showWinnerModal {
                WinnerModal(winnerName: self.cricketGameVM.winnerName!,
                            newGameAction: {
                                self.cricketGameVM.newGame()
                                self.showWinnerModal = false},
                            viewScoreboardAction: {
                                self.showWinnerModal = false},
                            undoAction: {
                                self.cricketGameVM.undo()
                                self.showWinnerModal = false})
                    .padding()
                    .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(2)
            }
        }
        .foregroundColor(Color.select(.primary))
        .navigationBarTitle(Text("Title")) // Placeholder title needed to avoid UI bug
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    //MARK: Scoreboard
    var scoreboard: some View {
        VStack {
            HStack {
                Button(
                    action: {
                        self.mode.wrappedValue.dismiss()
                    }
                ) {
                    Image(systemName: "house")
                }
                .frame(width: leftColumnWidth)
                .padding(.horizontal, 5)
                .foregroundColor(Color.select(.secondary))

                ForEach(0..<cricketGameVM.playerUnits.count) { index in
                    PlayerUnitView(playerUnitVM: self.cricketGameVM.playerUnits[index])
                        .padding(.horizontal, 5)
                        .padding(.vertical, 10)
                        .addBorder(Color.select(.secondary), width: 3, condition: self.shouldAddActiveBorder(on: index))
                }
            }
            .padding(.horizontal, 5)
            
            HStack {
                CricketHitLabelView()
                    .frame(width: leftColumnWidth)
                    .padding(.horizontal, 5)

                ForEach(0..<cricketGameVM.scores.count) { index in
                    CricketHitView(
                        scoreVM: CricketScoreViewModel(cricketScore: self.cricketGameVM.scores[index]),
                        onHit: {
                            self.cricketGameVM.updateGameState()
                            self.showWinnerModal = self.cricketGameVM.gameOver
                        },
                        wholeViewDisabled: self.shouldDisableHitView(at: index)
                    )
                    .padding(.horizontal, 5)
                    .disabled(self.shouldDisableHitView(at: index))
                }
            }
            .padding(.horizontal, 5)
        }
    }
    
    // MARK: Turn Controls
    var turnControls: some View {
        Group {
            if cricketGameVM.activeTurn != nil {
                HStack {
                    ForEach(cricketGameVM.activeTurn!.toString(), id: \.self) { label in
                        Text("\(label)")
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(label.contains("T") ? Color.select(.hitBackground) : Color.select(.primary) )
                            .addBorder((label.contains("T") ? Color.select(.hitBackground) : Color.select(.secondary)), width: 1)
                    }
                    if (!cricketGameVM.activeTurn!.canAddThrow()) {
                        Button(action: {
                            withAnimation {
                                self.cricketGameVM.nextPlayer()
                            }
                        }) {
                            Text("Next")
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PrimaryButtonStyle())
                    } else {
                        Button(action: {
                            self.cricketGameVM.hit(on: .miss, for: self.cricketGameVM.activeIndex)
                        }) {
                            Text("Miss")
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(SecondaryButtonStyle())
                    }
                }
                .padding(.horizontal)
                .font(.headline)
            }
        }
    }
    
    // MARK: BottomControls
    var bottomControls: some View {
        Group {
            HStack {
                Spacer()
                
                Button(action: {
                    withAnimation {
                        self.cricketGameVM.undo()
                    }
                }) {
                    Image(systemName: "arrow.uturn.left")
                        .textStyle(GameControlTextStyle())
                }
                .buttonStyle(SecondaryButtonStyle())
                
                Spacer()

                Button(action: {
                    withAnimation {
                        self.showNewGameModal = true
                    }
                }) {
                    Image(systemName: "arrow.2.circlepath")
                        .textStyle(GameControlTextStyle())
                }
                .buttonStyle(SecondaryButtonStyle())
                
                Spacer()
            }
            .font(.title)
            .foregroundColor(Color.select(.secondary))
        }
    }
    
    func shouldAddActiveBorder(on index: Int) -> Bool {
        if let _ = self.cricketGameVM.activeTurn {
            return cricketGameVM.activeIndex == index
        } else {
            return false
        }
    }
    
    func shouldDisableHitView(at index: Int) -> Bool {
        if let activeTurn = self.cricketGameVM.activeTurn {
            return self.cricketGameVM.activeIndex != index || !activeTurn.canAddThrow()
        } else {
            return false
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        CricketGameView(cricketGameVM: CricketGameViewModel(cricketGame: CricketGame(numberOfPlayers: 2)))
    }
}
#endif
