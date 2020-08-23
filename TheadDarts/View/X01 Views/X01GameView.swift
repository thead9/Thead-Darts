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
  @ObservedObject private var keyboard = KeyboardResponder()
  
  @State var showNewGameModal = false
  @State var showWinnerModal = false
  
  @State var disableBottomForMultiplier = false
    
  // MARK: Body
  var body: some View {
    ZStack {
      VStack {
        scoreBoard
                
        X01HitView(x01GameVM: x01GameVM,
          updateWinnerModal: {
            showWinnerModal = x01GameVM.gameOver
          },
          disableBottom: { shouldDisable in
            disableBottomForMultiplier = shouldDisable
          })
          .padding(.bottom, 5)
        
        turnControls
          .padding(.bottom, 2)
          .blur(radius: !x01GameVM.canAddThrow ? 5 : 0)
      }
      .font(.title)
      .padding(.vertical)
      .zIndex(1)
      .disabled(showNewGameModal || showWinnerModal)
      .blur(radius: showNewGameModal || showWinnerModal ? 5 : 0)
            
      if showNewGameModal {
        NewGameModal(
          affirmativeAction: {
            x01GameVM.newGame()
            showNewGameModal = false
          },
          cancelAction: { showNewGameModal = false} )
        .padding()
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
        .zIndex(2)
      }
            
      if showWinnerModal {
        WinnerModal(canViewScoreboard: false,
          winnerName: x01GameVM.winnerName!,
          newGameAction: {
            x01GameVM.newGame()
            showWinnerModal = false},
          viewScoreboardAction: { showWinnerModal = false },
          undoAction: {
            x01GameVM.undo()
            showWinnerModal = false})
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
          Button(action: { withAnimation { x01GameVM.undo() } } ) {
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
    
  var scoreBoard: some View {
    HStack {
      ForEach(0..<x01GameVM.playerUnits.count) { index in
        PlayerUnitView(playerUnitVM: x01GameVM.playerUnits[index])
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
    NavigationView{
      X01GameView(x01GameVM: X01GameViewModel(x01Game: X01Game(numberOfPlayers: 2)))
    }
  }
}
