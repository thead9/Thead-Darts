//
//  CricketHitView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 7/2/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct CricketHitView : View {
    @ObservedObject var score: CricketScore
        
    let cricketWedges: [Wedge] = [.twenty, .nineteen, .eightteen, .seventeen, .sixteen, .fifteen, .bull]
    
    let rows: CGFloat = 7
    let columns: CGFloat = 1
    let spacing: CGFloat = 5
    
    func getItemWidth(containerWidth: CGFloat) -> CGFloat {
        return (containerWidth - spacing * (columns - 1)) / columns
    }
    
    func getItemHeight(containerHeight: CGFloat) -> CGFloat {
        return (containerHeight - spacing * (rows - 1)) / rows
    }
    
    let onHit: () -> ()
    
    let wholeViewDisabled: Bool

    
    @State var selectingMultiplier: (Bool, Wedge) = (false, .one)
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: self.spacing) {
                if (self.selectingMultiplier.0) {
                    VStack(spacing: self.spacing) {
                        Text("\(self.selectingMultiplier.1.abbreviation())")
                            .padding(.bottom)
                            .foregroundColor(Color.select(.primary))
                                                
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                self.score.hit(on: self.selectingMultiplier.1, with: .single)
                                self.selectingMultiplier = (false, .one)
                                self.onHit()
                            }
                        }) {
                            Text("Single")
                                .font(.headline)
                                .padding(.vertical, 15)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PrimaryButtonStyle())
                        
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                self.score.hit(on: self.selectingMultiplier.1, with: .double)
                                self.selectingMultiplier = (false, .one)
                                self.onHit()
                            }
                        }) {
                            Text("Double")
                                .font(.headline)
                                .padding(.vertical, 15)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PrimaryButtonStyle())

                        
                        if (self.selectingMultiplier.1 != .bull) {
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    self.score.hit(on: self.selectingMultiplier.1, with: .triple)
                                    self.selectingMultiplier = (false, .one)
                                    self.onHit()
                                }
                            }) {
                                Text("Triple")
                                    .font(.headline)
                                    .padding(.vertical, 15)
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(PrimaryButtonStyle())
                        }
                        
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                self.selectingMultiplier = (false, .one)
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
                } else {
                    ForEach(self.cricketWedges, id: \.self) { wedge in
                        HStack(spacing: 0) {
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    self.selectingMultiplier = (true, wedge)
                                }
                            }) {
                                CricketMarkView(marks: self.score.marks[wedge])
                            }
                            .disabled(!self.score.shouldAllowHit(on: wedge))
                            .buttonStyle(SecondaryButtonStyle(addBorder: self.score.shouldAllowHit(on: wedge) && !self.wholeViewDisabled))
                        }
                        .animation(.easeInOut)
                        .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                        .frame(width: self.getItemWidth(containerWidth: geometry.size.width), height: self.getItemHeight(containerHeight: geometry.size.height))
                    }
                }
            }
            .font(.title)
        }
    }
}

#if DEBUG
struct CricketHitView_Previews : PreviewProvider {
    static var previews: some View {
        CricketHitView(score: CricketScore(), onHit: { }, wholeViewDisabled: false)
            .previewLayout(.fixed(width: 150, height: 650))
    }
}
#endif
