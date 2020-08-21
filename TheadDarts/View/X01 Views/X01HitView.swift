//
//  X01HitView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/29/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct X01HitView: View {

  @ObservedObject var x01GameVM: X01GameViewModel
    
  var updateWinnerModal: () -> ()
  var disableBottom: (Bool) -> ()
    
  var animationTime = 0.25
    
  // MARK: Body
  var body: some View {
    ZStack(alignment: .center) {
      x01HitGrid
        .disabled(selectingMultiplier.0 || (!x01GameVM.canAddThrow && !x01GameVM.gameOver))
        .blur(radius: selectingMultiplier.0 || (!x01GameVM.canAddThrow && !x01GameVM.gameOver) ? 5 : 0)
            
      if selectingMultiplier.0 {
        x01SelectingMultiplier
          .frame(maxWidth: 450)
          .zIndex(2)
      }
      
      if !x01GameVM.canAddThrow && !x01GameVM.gameOver {
        x01TurnOverview
          .frame(maxWidth: 450)
          .zIndex(3)
      }
    }
  }
    
  // MARK: Hit Grid
  @State var selectingMultiplier: (Bool, Wedge) = (false, .one)
    
  func x01HitButtonAction(for wedge: Wedge) {
    if wedge == .miss {
      x01GameVM.hit(on: .miss)
    } else {
      selectingMultiplier = (true, wedge)
      disableBottom(true)
    }
  }
    
  func isBullOrMiss(wedge: Wedge) -> Bool {
    return wedge == .bull || wedge == .miss
  }
    
  let wedgesArray: [[Wedge]] = [[.one, .two, .three, .four],
                                [.five, .six, .seven, .eight],
                                [.nine, .ten, .eleven, .twelve],
                                [.thirteen, .fourteen, .fifteen, .sixteen],
                                [.seventeen, .eightteen, .nineteen, .twenty],
                                [.bull, .miss]]
  
  var x01HitGrid: some View {
    VStack(spacing: 5) {
      ForEach(0..<wedgesArray.count) { rowIndex in
        HStack(spacing: 5) {
          ForEach(wedgesArray[rowIndex]) { wedge in
            Button(action: {
              withAnimation(.easeInOut(duration: animationTime)) {
                x01HitButtonAction(for: wedge)
              }
            }) {
              if isBullOrMiss(wedge: wedge) {
                Text("\(wedge.name())")
                  .padding(.vertical)
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
              } else {
                Text("\(wedge.rawValue)")
                  .padding(.vertical)
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
              }
            }
            .buttonStyle(SecondaryButtonStyle())
            .disabled(!x01GameVM.canAddThrow)
          }
        }
      }
    }
  }
    
  enum X01MultiplierButtonWidth: EqualLength {}
    let rightColumnWidth = GeometryPreferenceReader(
      key: AppendValue<X01MultiplierButtonWidth>.self,
      value: { [$0.size.width] }
    )
  @State var x01MultiplierButtonWidth: CGFloat? = nil
  
  // MARK: Selecting Multiplier
  var x01SelectingMultiplier: some View {
    VStack(spacing: 5) {
      Text("\(selectingMultiplier.1.abbreviation())")
        .font(.largeTitle)
        .foregroundColor(Color.select(.primary))
         
      ForEach(Multiplier.allCases) { multiplier in
        if (selectingMultiplier.1 != .bull || (selectingMultiplier.1 == .bull && multiplier != .triple)) {
          Button(action: {
            withAnimation(.easeInOut(duration: 0.25)) {
              x01GameVM.hit(on: selectingMultiplier.1, with: multiplier)
              selectingMultiplier = (false, .one)
              disableBottom(false)
              updateWinnerModal()
            }
          }) {
            Text("\(multiplier.name())")
              .font(.headline)
              .padding(.vertical, 15)
              .padding(.horizontal, 100)
              .readEqualLength(rightColumnWidth)
              .frame(width: x01MultiplierButtonWidth)
          }
          .buttonStyle(PrimaryButtonStyle())
        }
      }
        
      Button(action: {
        withAnimation(.easeInOut(duration: animationTime)) {
          selectingMultiplier = (false, .one)
          disableBottom(false)
        }
      }) {
        Text("Cancel")
          .font(.subheadline)
          .padding(.vertical, 10)
          .padding(.horizontal, 50)
          .readEqualLength(rightColumnWidth)
          .frame(width: x01MultiplierButtonWidth)
      }
      .buttonStyle(CancelButtonStyle())
    }
    .padding(.vertical)
    .padding(.horizontal, 10)
    .background(Color.select(.hitBackground))
    .cornerRadius(25)
    .addBorder(Color.select(.primary), width: 2)
    .padding()
    .assignEqualLength(for: rightColumnWidth.key, to: $x01MultiplierButtonWidth)
  }
    
  // MARK: Turn Summary
  var x01TurnOverview: some View {
    VStack {
      VStack(alignment: .leading, spacing: 0) {
        Text("Turn Summary")
          .textStyle(CardTitleTextStyle())
          
        Rectangle()
          .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
          .foregroundColor(Color.select(.primary))
          
        VStack(alignment: .leading, spacing: 0) {
          ForEach(0..<x01GameVM.activeTurn.dartThrows.count, id: \.self) { index in
            HStack(spacing: 10) {
              Text("Throw \(index + 1)")
              Text("\(x01GameVM.activeTurn.dartThrows[index].toString())")
                .foregroundColor(Color.select(.secondary))
            }
            .font(.title)
            .padding(.horizontal)
            .padding(.bottom, 5)
          }
            
          Rectangle()
            .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
            .foregroundColor(Color.select(.primary))
            
          HStack(spacing: 10) {
            Text("Scored")
            Text("\(x01GameVM.activeTurn.totalScore())")
              .foregroundColor(Color.select(.secondary))
          }
          .padding(.horizontal)
          .padding(.top, 5)
            
          HStack(spacing: 10) {
            Text("Remaining")
            Text("\(x01GameVM.activeTurnPoints)")
                .foregroundColor(Color.select(.secondary))
          }
          .padding(.horizontal)
          .padding(.top, 5)
        }
        .padding(.vertical, 5)
      }
      .background(Color.select(.background))
      .cornerRadius(25)
      .addBorder(Color.select(.primary), width: 2)
      
      Button(action: {
        withAnimation(.easeInOut(duration: animationTime)) {
          x01GameVM.nextPlayer()
        }
      }) {
        Text("Next")
          .padding(.vertical)
          .padding(.horizontal, 100)
      }
      .buttonStyle(PrimaryButtonStyle())
      .padding(.top)
    }
    .padding(.horizontal)
  }
}

struct X01HitView_Previews: PreviewProvider {
  static var previews: some View {
    X01HitView(x01GameVM: X01GameViewModel(x01Game: X01Game(numberOfPlayers: 2)), updateWinnerModal: { }, disableBottom: { bogus in })
      .previewLayout(.sizeThatFits)
  }
}
