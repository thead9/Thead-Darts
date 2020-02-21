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
    
    @ObservedObject var x01GameVM: X01GameViewModel
    
    @State var showNewGameModal = false
    @State var showWinnerModal = false
    
    // MARK: Body
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button( action: { self.mode.wrappedValue.dismiss() } ) {
                        Image(systemName: "house")
                    }
                    .frame(width: 50)
                    .padding(.horizontal)
                    .foregroundColor(Color.select(.secondary))
                    
                    scoreBoard
                }
                
                
                X01HitView(x01GameVM: x01GameVM, updateWinnerModal: { self.showWinnerModal = self.x01GameVM.gameOver } )
                
                if x01GameVM.canAddThrow {
                    turnControls
                        .padding(.bottom, 2)
                }
                
                bottomControls
            }
            .font(.title)
            .padding(.vertical)
            .zIndex(1)
            .disabled(showNewGameModal || showWinnerModal)
            .blur(radius: showNewGameModal || showWinnerModal ? 5 : 0)
            
            if showNewGameModal {
                NewGameModal(affirmativeAction: {
                                self.x01GameVM.newGame()
                                self.showNewGameModal = false
                            },
                             cancelAction: { self.showNewGameModal = false} )
                    .padding()
                    .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(2)
            }
            
            if showWinnerModal {
                WinnerModal(canViewScoreboard: false,
                            winnerName: self.x01GameVM.winnerName!,
                            newGameAction: {
                                self.x01GameVM.newGame()
                                self.showWinnerModal = false},
                            viewScoreboardAction: {
                                self.showWinnerModal = false},
                            undoAction: {
                                self.x01GameVM.undo()
                                self.showWinnerModal = false})
                    .padding()
                    .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(2)
            }
        }
        .foregroundColor(Color.select(.primary))
        .navigationBarTitle(Text("Title"))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    var scoreBoard: some View {
        HStack {
            ForEach(0..<x01GameVM.playerUnits.count) { index in
                PlayerUnitView(playerUnitVM: self.x01GameVM.playerUnits[index])
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
                ForEach(x01GameVM.activeTurn.toString(), id: \.self) { label in
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

                Button(action: { withAnimation { self.x01GameVM.undo() } } ) {
                    Image(systemName: "arrow.uturn.left")
                        .textStyle(GameControlTextStyle())
                }
                .padding(.horizontal, 20)
                .buttonStyle(SecondaryButtonStyle())
                
                Spacer()
                
                Button(action: { withAnimation { self.showNewGameModal = true } } ) {
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
        return x01GameVM.activeIndex == index
    }
}

struct X01GameView_Previews: PreviewProvider {
    static var previews: some View {
        X01GameView(x01GameVM: X01GameViewModel(x01Game: X01Game(numberOfPlayers: 2)))
    }
}
