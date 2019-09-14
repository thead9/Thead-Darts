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
    
    @State var selectingMultiplier: (Bool, Wedge) = (false, .one)
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: self.spacing) {
                if (self.selectingMultiplier.0) {
                    VStack(spacing: 5) {
                        Text("\(self.selectingMultiplier.1.abbreviation())")
                            .padding(.bottom)
                            .foregroundColor(Color("Primary"))
                                                
                        Button(
                            action: {
                                self.score.hit(on: self.selectingMultiplier.1, with: .single)
                                self.selectingMultiplier = (false, .one)
                                self.onHit()
                            }
                        ) {
                            Text("Single")
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                        }
                        .background(Color("Secondary"))
                        .foregroundColor(Color("Background"))
                        .cornerRadius(25)
                        
                        Button(
                            action: {
                                self.score.hit(on: self.selectingMultiplier.1, with: .double)
                                self.selectingMultiplier = (false, .one)
                                self.onHit()
                            }
                        ) {
                            Text("Double")
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                        }
                        .background(Color("Secondary"))
                        .foregroundColor(Color("Background"))
                        .cornerRadius(25)
                        
                        if (self.selectingMultiplier.1 != .bull) {
                            Button(
                                action: {
                                    self.score.hit(on: self.selectingMultiplier.1, with: .triple)
                                    self.selectingMultiplier = (false, .one)
                                    self.onHit()
                                }
                            ) {
                                Text("Triple")
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: .infinity)
                            }
                            .background(Color("Secondary"))
                            .foregroundColor(Color("Background"))
                            .cornerRadius(25)
                        }
                        
                        Button(
                            action: {
                                self.selectingMultiplier = (false, .one)
                            }
                        ) {
                            Text("Cancel")
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .font(.subheadline)
                        }
                        .background(Color(.gray))
                        .foregroundColor(Color("Background"))
                        .cornerRadius(20)
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 10)
                    .background(Color("HitBackground"))
                    .cornerRadius(25)
                    .addBorder(Color("Primary"), width: 2)
                } else {
                    ForEach(self.cricketWedges, id: \.self) { wedge in
                        HStack(spacing: 0) {
                            Button(
                                action: {
                                    self.selectingMultiplier = (true, wedge)
                                }
                            ) {
                                CricketMarkView(marks: self.score.getMarks(for: wedge))
                            }
                            .disabled(!self.score.shouldAllowHit(on: wedge))
                        }
                        .frame(width: self.getItemWidth(containerWidth: geometry.size.width), height: self.getItemHeight(containerHeight: geometry.size.height))
                        .background(Color("HitBackground"))
                        .cornerRadius(25)
                        .addBorder(Color("Primary"), width: 2)
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
        CricketHitView(score: CricketScore(), onHit: { })
            .previewLayout(.fixed(width: 150, height: 650))
    }
}
#endif
