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
    
    @ObservedObject var cricketGame: CricketGame
    
    @State var gameOver = false
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
                                self.cricketGame.newGame()
                                self.setGameOver()
                                self.showNewGameModal = false
                             },
                             cancelAction: {
                                self.showNewGameModal = false})
                    .padding()
                    .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(2)
            }
            
            if showWinnerModal {
                WinnerModal(winnerName: self.cricketGame.winner!.name,
                            newGameAction: {
                                self.cricketGame.newGame()
                                self.setGameOver()
                                self.showWinnerModal = false},
                            viewScoreBoardAction: {
                                self.showWinnerModal = false},
                            undoAction: {
                                self.cricketGame.scoreKeeper.undo()
                                self.setGameOver()
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

                ForEach(0..<cricketGame.scores.count) { index in
                    CricketPlayerUnitView(playerUnit: self.cricketGame.playerUnits[index])
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

                ForEach(0..<cricketGame.scores.count) { index in
                    CricketHitView(
                        score: self.cricketGame.scores[index],
                        onHit: {
                            self.showWinnerModal = self.cricketGame.gameOver
                            self.setGameOver()
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
            if cricketGame.scoreKeeper.activeTurn != nil {
                HStack {
                    ForEach(cricketGame.scoreKeeper.activeTurn!.toString(), id: \.self) { label in
                        Text("\(label)")
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(label.contains("T") ? Color.select(.hitBackground) : Color.select(.primary) )
                            .addBorder((label.contains("T") ? Color.select(.hitBackground) : Color.select(.secondary)), width: 1)
                    }
                    if (!cricketGame.scoreKeeper.activeTurn!.canAddThrow()) {
                        Button(action: {
                            withAnimation {
                                self.cricketGame.scoreKeeper.nextPlayer()
                            }
                        }) {
                            Text("Next")
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PrimaryButtonStyle())
                    } else {
                        Button(action: {
                            self.cricketGame.scores[self.cricketGame.scoreKeeper.activeIndex].hit(on: .miss)
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
                        self.cricketGame.scoreKeeper.undo()
                        self.setGameOver()
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
    
    func setGameOver() {
        self.gameOver = self.cricketGame.gameOver
    }
    func isActiveIndex(_ index: Int) -> Bool {
        return index == self.cricketGame.scoreKeeper!.activeIndex
    }
    
    func shouldAddActiveBorder(on index: Int) -> Bool {
        return self.cricketGame.scoreKeeper.activeIndex == index && self.cricketGame.scoreKeeper.activeTurn != nil
    }
    
    func shouldDisableHitView(at index: Int) -> Bool {
        if let activeTurn = self.cricketGame.scoreKeeper.activeTurn {
            return self.cricketGame.scoreKeeper.activeIndex != index || !activeTurn.canAddThrow()
        } else {
            return false
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        CricketGameView(cricketGame: CricketGame(numberOfPlayers: 2))
    }
}
#endif
