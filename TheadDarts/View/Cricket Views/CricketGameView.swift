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
        ActionSheet(
            title: Text("New Game"),
            message: Text("Are you sure you want to start a new game?"),
            buttons: [
                .destructive(
                    Text("Yes"), action: {
                        self.cricketGame.newGame()
                        self.setGameOver()
                    }
                ),
                .default(Text("No"))
            ]
        )
    }
            
    // MARK: Body
    let leftColumnWidth: CGFloat = 50

    var body: some View {
        VStack {
            scoreboard
            
            turnControls
            
            bottomControls
        }
        .padding(.vertical)
        .actionSheet(isPresented: $showNewGameActionSheet) { self.newGameActionSheet }
        .alert(isPresented: $showWinnerAlert) { self.winnerAlert }
        .foregroundColor(Color("Primary"))
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
                .foregroundColor(Color("Secondary"))

                ForEach(0..<cricketGame.scores.count) { index in
                    CricketPlayerUnitView(playerUnit: self.cricketGame.playerUnits[index])
                        .padding(.horizontal, 5)
                        .addBorder(Color("Secondary"), width: 3, condition: self.shouldAddActiveBorder(on: index))
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
                        }
                    )
                    .padding(.horizontal, 5)
                    .disabled(self.shouldDisableHitView(at: index))
                }
            }
            .padding(.horizontal, 5)
        }
        .padding(.bottom)
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
                            .foregroundColor(label.contains("T") ? Color("HitBackground") : Color("Primary") )
                            .addBorder((label.contains("T") ? Color("HitBackground") : Color("Secondary")), width: 1)
                    }
                    if (!cricketGame.scoreKeeper.activeTurn!.canAddThrow()) {
                        Button(action: { self.cricketGame.scoreKeeper.nextPlayer() }) {
                            Text("Next")
                                .padding()
                                .frame(maxWidth: .infinity)
                        }
                        .background(Color("Secondary"))
                        .foregroundColor(Color("HitBackground"))
                        .cornerRadius(25)
                    } else {
                        Button(action: { self.cricketGame.scores[self.cricketGame.scoreKeeper.activeIndex].hit(on: .miss) }) {
                            Text("Miss")
                                .padding()
                                .frame(maxWidth: .infinity)
                        }
                        .background(Color("HitBackground"))
                        .foregroundColor(Color("Secondary"))
                        .addBorder(Color("Primary"), width: 2)
                        .cornerRadius(25)
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
                Button(
                    action: {
                        self.cricketGame.scoreKeeper.undo()
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
