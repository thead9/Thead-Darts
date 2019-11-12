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
    
    @State var gameOver: Bool = false
    @State var showWinnerAlert: Bool = false
    var winnerAlert: Alert {
        Alert(title: Text("Winner!"),
              message: Text("\(self.cricketGame.winner!.name) has won!"),
              primaryButton: .default(Text("New Game")) {
                    self.cricketGame.newGame()
                    self.setGameOver()
              },
              secondaryButton: .default(Text("View Scoreboard"))
        )
    }
    
    @State var showNewGameActionSheet = false
    var newGameActionSheet: ActionSheet {
        ActionSheet(title: Text("New Game"),
                    message: Text("Are you sure you want to start a new game?"),
                    buttons: [.destructive(Text("Yes"),
                                action: {
                                    self.cricketGame.newGame()
                                    self.setGameOver()
                                }),
                              .default(Text("No"))])
    }
    
    @State var showNewGameModal = false
    var newGameModal: some View {
        VStack {
            Text("New Game")
                .font(.largeTitle)
            Text("Are you sure you want to start a new game?")
                .multilineTextAlignment(.center)
            
            HStack {
                Button(action: {
                    withAnimation {
                        self.cricketGame.newGame()
                        self.setGameOver()
                        self.showNewGameModal = false
                    }
                }) {
                    Text("Yes")
                        .padding()
                        .frame(maxWidth: 200)
                }
                .buttonStyle(DestructiveButtonStyle())
                Button(action: {
                    withAnimation {
                        self.showNewGameModal = false
                    }
                }) {
                    Text("No")
                        .padding()
                        .frame(maxWidth: 200)
                }
                .buttonStyle(SecondaryButtonStyle(addBorder: false))
            }
            .padding(.top)
        }
        .font(.title)
        .padding()
        .background(Color.select(.background))
        .cornerRadius(25)
    }
            
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
            //.actionSheet(isPresented: $showNewGameActionSheet) { self.newGameActionSheet }
            .zIndex(1)
            .disabled(showNewGameModal)
            .blur(radius: showNewGameModal ? 5 : 0)
            
            if showNewGameModal {
                newGameModal
                    .padding()
                    .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(2)
            }
        }
        .alert(isPresented: $showWinnerAlert) { self.winnerAlert }
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
                            self.showWinnerAlert = self.cricketGame.gameOver
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
