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
  
  let cricketLabelWidth: CGFloat = 50
            
  // MARK: Body
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
  enum CricketHitHeight: EqualLength {}
  let cricketHitHeightReader = GeometryPreferenceReader(
    key: AppendValue<CricketHitHeight>.self,
    value: { [$0.size.height] }
  )
  @State var cricketHitHeight: CGFloat? = nil
  
  var scoreboard: some View {
    HStack(alignment: .bottom) {
      ForEach(0..<cricketGameVM.scoreVMs.count) { index in
        cricketLaneView(
          playerUnitVM: cricketGameVM.playerUnitVMs[index],
          scoreVM: cricketGameVM.scoreVMs[index],
          isWholeViewDisabled: shouldDisableHitView(at: index),
          onHit: {
            cricketGameVM.updateGameState()
            showWinnerModal = cricketGameVM.gameOver
          },
          startPlayerNameEditing: { playerName, updatePlayerName in
            playerNameBeingEdited = playerName
            updatePlayerNameBeingEdited = updatePlayerName
          })
          .padding(.horizontal, 10)
        
        if (cricketGameVM.scoreVMs.count.isMultiple(of: 2) &&
              (cricketGameVM.scoreVMs.count / 2) - 1 == index) {
          CricketHitLabelView(bullRequired: cricketGameVM.bullRequired)
            .readEqualLength(cricketHitHeightReader)
            .frame(width: cricketLabelWidth, height: cricketHitHeight)
        }
      }
    }
    .assignEqualLength(for: cricketHitHeightReader.key, to: $cricketHitHeight)
  }
  
  @ViewBuilder
  func cricketLaneView(playerUnitVM: PlayerUnitViewModel<CricketScore>,
                       scoreVM: CricketScoreViewModel,
                       isWholeViewDisabled: Bool,
                       onHit: @escaping () -> (),
                       startPlayerNameEditing: @escaping (String, @escaping (String) -> ()) -> ()) -> some View {
    VStack {
      PlayerUnitView(playerUnitVM: playerUnitVM,
                     startPlayerNameEditing: startPlayerNameEditing)
      
      CricketHitView(scoreVM: scoreVM, onHit: onHit, wholeViewDisabled: isWholeViewDisabled)
        .readEqualLength(cricketHitHeightReader)
        .frame(height: cricketHitHeight)
    }
    .assignEqualLength(for: cricketHitHeightReader.key, to: $cricketHitHeight)
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
              .foregroundColor(label.contains("T") ? Color.select(.hitBackground) :
                                                     Color.select(.primary) )
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
