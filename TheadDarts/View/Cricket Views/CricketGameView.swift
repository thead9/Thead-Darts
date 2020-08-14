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
  @ObservedObject private var keyboard = KeyboardResponder()
  
  @State var playerNameBeingEdited: String?
  @State var updatePlayerNameBeingEdited: (String) -> () = { _ in }
  @State var showNewGameModal = false
  @State var showWinnerModal = false
            
  // MARK: Body
  let leftColumnWidth: CGFloat = 50

  var body: some View {
    ZStack {
      VStack {
        scoreboard
          .padding(.bottom, 5)
            
        turnControls
          .padding(.bottom, 2)
      }
      .font(.title)
      .padding(.vertical)
      .zIndex(1)
      .disabled(showNewGameModal || showWinnerModal || playerNameBeingEdited != nil)
      .blur(radius: showNewGameModal || showWinnerModal || playerNameBeingEdited != nil ? 5 : 0)
        
      if playerNameBeingEdited != nil {
        EditPlayerNameModal(
          affirmativeAction: { newPlayerName in
            updatePlayerNameBeingEdited(newPlayerName)
            playerNameBeingEdited = nil
          },
          cancelAction: { playerNameBeingEdited = nil },
          playerName: playerNameBeingEdited!)
        .padding()
        .padding(.bottom, keyboard.currentHeight)
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
        .zIndex(2)
      }
        
      if showNewGameModal {
        NewGameModal(
          affirmativeAction: {
            cricketGameVM.newGame()
            showNewGameModal = false
          },
          cancelAction: { showNewGameModal = false } )
        .padding()
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
        .zIndex(2)
      }
        
      if showWinnerModal {
        WinnerModal(winnerName: cricketGameVM.winnerName!,
          newGameAction: {
              cricketGameVM.newGame()
              showWinnerModal = false
          },
          viewScoreboardAction: { showWinnerModal = false},
          undoAction: {
              cricketGameVM.undo()
              showWinnerModal = false
          })
        .padding()
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
        .zIndex(2)
      }
    }
    .foregroundColor(Color.select(.primary))
    .hiddenNavigationBarStyle()
    .toolbar {
      ToolbarItem(placement: .bottomBar) { Spacer() }
      ToolbarItem(placement: .bottomBar) {
        HStack {
          Spacer().frame(width: 0)
          Button(action: { mode.wrappedValue.dismiss() } ) {
            Image(systemName: "house")
              .font(.title)
              .padding()
              .foregroundColor(Color.select(.primary))
          }
        }
      }
      ToolbarItem(placement: .bottomBar) { Spacer() }
      ToolbarItem(placement: .bottomBar) {
        HStack {
          Spacer().frame(width: 0)
          Button(action: { withAnimation { cricketGameVM.undo() } } ) {
            Image(systemName: "arrow.uturn.left")
              .font(.title)
              .padding()
          }
          .foregroundColor(Color.select(.secondary))
        }
      }
      ToolbarItem(placement: .bottomBar) { Spacer() }
      ToolbarItem(placement: .bottomBar) {
        HStack {
          Spacer().frame(width: 0)
          Button(action: { withAnimation { showNewGameModal = true } } ) {
            Image(systemName: "arrow.2.circlepath")
              .font(.title)
              .padding()
          }
          .foregroundColor(Color.select(.secondary))
        }
      }
      ToolbarItem(placement: .bottomBar) { Spacer() }
    }
  }
    
  //MARK: Scoreboard
  var scoreboard: some View {
    VStack {
      HStack {
        Button(action: { }) {
          Image(systemName: "house")
        }
        .frame(width: leftColumnWidth)
        .padding(.horizontal, 5)
        .foregroundColor(Color.select(.secondary))

        ForEach(0..<cricketGameVM.playerUnits.count) { index in
          PlayerUnitView(playerUnitVM: cricketGameVM.playerUnits[index],
                         startPlayerNameEditing: { playerName, updatePlayerName in
                           playerNameBeingEdited = playerName
                           updatePlayerNameBeingEdited = updatePlayerName
                         })
          .padding(.horizontal, 5)
          .padding(.vertical, 10)
          .addBorder(Color.select(.secondary), width: 3, condition: shouldAddActiveBorder(on: index))
        }
      }
      .padding(.horizontal, 5)
        
      HStack {
        CricketHitLabelView(bullRequired: cricketGameVM.bullRequired)
          .frame(width: leftColumnWidth)
          .padding(.horizontal, 5)

        ForEach(0..<cricketGameVM.scores.count) { index in
          CricketHitView(
            scoreVM: CricketScoreViewModel(cricketScore: cricketGameVM.scores[index], showPoints: cricketGameVM.showPoints),
            onHit: {
                cricketGameVM.updateGameState()
                showWinnerModal = cricketGameVM.gameOver
            },
            wholeViewDisabled: shouldDisableHitView(at: index)
          )
          .padding(.horizontal, 5)
          .disabled(shouldDisableHitView(at: index))
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
            Button(action: { withAnimation { cricketGameVM.nextPlayer() } } ) {
              Text("Next")
                  .padding(.vertical)
                  .frame(maxWidth: .infinity)
            }
            .buttonStyle(PrimaryButtonStyle())
          } else {
            Button(action: { cricketGameVM.hit(on: .miss, for: cricketGameVM.activeIndex) } ) {
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
    
  func shouldAddActiveBorder(on index: Int) -> Bool {
    if let _ = cricketGameVM.activeTurn {
      return cricketGameVM.activeIndex == index
    } else {
      return false
    }
  }
  
  func shouldDisableHitView(at index: Int) -> Bool {
    if let activeTurn = cricketGameVM.activeTurn {
      return cricketGameVM.activeIndex != index || !activeTurn.canAddThrow()
    } else {
      return false
    }
  }
}

struct HiddenNavigationBar: ViewModifier {
  @State var isHidden = false
  
  func body(content: Content) -> some View {
    content
      .navigationBarTitle("", displayMode: .inline)
      .navigationBarHidden(isHidden)
      .onAppear { self.isHidden = true }
  }
}

extension View {
  func hiddenNavigationBarStyle() -> some View {
    modifier( HiddenNavigationBar() )
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static let cricketGameVM = CricketGameViewModel(cricketGame: CricketGame(numberOfPlayers: 2))
  static var previews: some View {
    Group {
      NavigationView {
        CricketGameView(cricketGameVM: cricketGameVM)
      }
    }
  }
}
#endif
