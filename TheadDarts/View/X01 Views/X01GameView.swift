//
//  SwiftUIView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/28/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct X01GameView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @ObservedObject var x01Game: X01Game
    
    @State var gameOver = false
    @State var showNewGameModal = false
    @State var showWinnerAlert = false
    var winnerAlert: Alert {
        Alert(title: Text("Winner!"),
              message: Text("\(self.x01Game.winner!.name) has won!"),
              primaryButton: .default(Text("New Game")) {
                    self.x01Game.newGame()
                    self.setGameOver()
              },
              secondaryButton: .default(Text("View Scoreboard"))
        )
    }
    
    // MARK: Body
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(
                        action: {
                            self.mode.wrappedValue.dismiss()
                        }
                    ) {
                        Image(systemName: "house")
                    }
                    .frame(width: 50)
                    .padding(.horizontal)
                    .foregroundColor(Color.select(.secondary))
                    
                    scoreBoard
                }
                
                
                X01HitView(x01Game: x01Game,
                           onHit: {
                            self.showWinnerAlert = self.x01Game.gameOver
                            self.gameOver = self.x01Game.gameOver
                           })
                
                if (x01Game.scoreKeeper.activeTurn.canAddThrow()) {
                    turnControls
                        .padding(.bottom, 2)
                }
                
                bottomControls
            }
            .font(.title)
            .padding(.vertical)
            .zIndex(1)
            .disabled(showNewGameModal)
            .blur(radius: showNewGameModal ? 5 : 0)
            
            if showNewGameModal {
                NewGameModal(affirmativeAction: {
                                self.x01Game.newGame()
                                self.setGameOver()
                                self.showNewGameModal = false
                            },
                             cancelAction: {
                                self.showNewGameModal = false})
                    .padding()
                    .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(2)
            }
        }
        .alert(isPresented: $showWinnerAlert) { self.winnerAlert }
        .foregroundColor(Color.select(.primary))
        .navigationBarTitle(Text("Title"))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    var scoreBoard: some View {
        HStack {
            ForEach(0..<x01Game.scores.count) { index in
                X01PlayerUnitView(playerUnit: self.x01Game.playerUnits[index])
                    .padding(.horizontal, 5)
                    .padding(.vertical, 10)
                    .addBorder(Color.select(.secondary), width: 3, condition: self.shouldAddActiveBorder(on: index))
            }
        }
        .padding(.horizontal, 5)
    }
    
    // MARK: Turn Controls
    var turnControls: some View {
        Group {
            HStack {
                ForEach(x01Game.scoreKeeper!.activeTurn.toString(), id: \.self) { label in
                    Text("\(label)")
                        .textStyle(ThrowTextStyle(label))
                }
            }
            .padding(.horizontal)
            .font(.headline)
        }
    }
    
    // MARK: BottomControls
    var bottomControls: some View {
        Group {
            HStack {
                Spacer()

                Button(action: {
                    withAnimation {
                        self.x01Game.scoreKeeper.undo()
                        self.setGameOver()
                    }
                }) {
                    Image(systemName: "arrow.uturn.left")
                        .textStyle(GameControlTextStyle())
                }
                .padding(.horizontal, 20)
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
        self.gameOver = self.x01Game.gameOver
    }
    
    func isActiveIndex(_ index: Int) -> Bool {
        return index == self.x01Game.scoreKeeper.activeIndex
    }
    
    func shouldAddActiveBorder(on index: Int) -> Bool {
        return self.x01Game.scoreKeeper.activeIndex == index
    }
}

struct X01GameView_Previews: PreviewProvider {
    static var previews: some View {
        X01GameView(x01Game: X01Game(numberOfPlayers: 2))
    }
}
