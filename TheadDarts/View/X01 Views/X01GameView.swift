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
    
    @State var gameOver: Bool = false
    @State var showWinnerAlert: Bool = false
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
    
    @State var showNewGameActionSheet = false
    var newGameActionSheet: ActionSheet {
        ActionSheet(
            title: Text("New Game"),
            message: Text("Are you sure you want to start a new game?"),
            buttons: [
                .destructive(
                    Text("Yes"), action: {
                        self.x01Game.newGame()
                        self.setGameOver()
                    }
                ),
                .default(Text("No"))
            ]
        )
    }
    
    // MARK: Body
    var body: some View {
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
                .foregroundColor(Color("Secondary"))
                
                scoreBoard
            }
            
            
            X01HitView(x01Game: x01Game,
                       onHit: {
                        self.showWinnerAlert = self.x01Game.gameOver
                        self.gameOver = self.x01Game.gameOver
                       })
            
            turnControls
            
            bottomControls
        }
        .foregroundColor(Color("Primary"))
        .actionSheet(isPresented: $showNewGameActionSheet) { self.newGameActionSheet }
        .alert(isPresented: $showWinnerAlert) { self.winnerAlert }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    var scoreBoard: some View {
        HStack {
            ForEach(0..<x01Game.scores.count) { index in
                X01PlayerUnitView(playerUnit: self.x01Game.playerUnits[index])
                    .padding(.horizontal, 5)
                    .addBorder(Color("Secondary"), width: 3, condition: self.shouldAddActiveBorder(on: index))
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
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(label.contains("T") ? Color("HitBackground") : Color("Primary") )
                        .addBorder((label.contains("T") ? Color("HitBackground") : Color("Secondary")), width: 1)
                }
                if (!x01Game.scoreKeeper.activeTurn.canAddThrow()) {
                    Button(action: { self.x01Game.scoreKeeper.nextPlayer() }) {
                        Text("Next")
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    .background(Color("Secondary"))
                    .foregroundColor(Color("HitBackground"))
                    .cornerRadius(25)
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
                Button(
                    action: {
                        self.x01Game.scoreKeeper.undo()
                        self.setGameOver()
                    }
                ) {
                    Image(systemName: "arrow.uturn.left")
                }
                .padding(.horizontal)
                
                Button(action: { self.showNewGameActionSheet = true } ) {
                    Image(systemName: "trash")
                }
                .padding(.horizontal)
            }
            .font(.title)
            .foregroundColor(Color("Secondary"))
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
