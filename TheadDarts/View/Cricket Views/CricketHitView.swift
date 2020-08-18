//
//  CricketHitView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 7/2/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct CricketHitView : View {
  @ObservedObject var scoreVM: CricketScoreViewModel
  @State var selectingMultiplier: (Bool, Wedge) = (false, .one)
    
  let onHit: () -> ()
  let wholeViewDisabled: Bool
  let spacing: CGFloat = 5
    
  var body: some View {
    ZStack {
      VStack(spacing: spacing) {
        ForEach(Wedge.cricketWedges(isBoolRequired: scoreVM.bullRequired)) { wedge in
          Button(action: {
            withAnimation(.easeInOut(duration: 0.25)) {
              selectingMultiplier = (true, wedge)
            }
          }) {
            CricketMarkView(marks: scoreVM.marks[wedge], showPoints: scoreVM.showPoints)
          }
          .animation(.easeInOut)
          .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
          .disabled(!scoreVM.shouldAllowHit(on: wedge))
          .buttonStyle(SecondaryButtonStyle(addBorder: scoreVM.shouldAllowHit(on: wedge) &&
                                                       !wholeViewDisabled))
        }
      }
      .font(.title)
      .opacity(!selectingMultiplier.0 ? 1 : 0)
      .zIndex(!selectingMultiplier.0 ? 1 : 0)
      
      VStack(spacing: spacing) {
        Text("\(selectingMultiplier.1.abbreviation())")
          .padding(.bottom)
          .foregroundColor(Color.select(.primary))
                    
        ForEach(Multiplier.allCases) { multiplier in
          if (selectingMultiplier.1 != .bull ||
              (selectingMultiplier.1 == .bull && multiplier != .triple)) {
            Button(action: {
              withAnimation(.easeInOut(duration: 0.25)) {
                scoreVM.hit(on: selectingMultiplier.1, with: multiplier)
                selectingMultiplier = (false, .one)
                onHit()
              }
            }) {
              Text("\(multiplier.name())")
                .font(.headline)
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(PrimaryButtonStyle())
          }
        }
                    
        Button(action: {
          withAnimation(.easeInOut(duration: 0.25)) {
            selectingMultiplier = (false, .one)
          }
        }) {
          Text("Cancel")
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .font(.subheadline)
        }
        .buttonStyle(CancelButtonStyle())
      }
      .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
      .padding(.vertical)
      .padding(.horizontal, 10)
      .frame(maxWidth: 250)
      .background(Color.select(.hitBackground))
      .cornerRadius(25)
      .addBorder(Color.select(.primary), width: 2)
      .opacity(selectingMultiplier.0 ? 1 : 0)
      .zIndex(selectingMultiplier.0 ? 1 : 0)
    }
  }
}

#if DEBUG
struct CricketHitView_Previews : PreviewProvider {
    static var previews: some View {
        CricketHitView(scoreVM: CricketScoreViewModel(cricketScore: CricketScore()), onHit: { }, wholeViewDisabled: false)
            .previewLayout(.fixed(width: 150, height: 650))
    }
}
#endif
