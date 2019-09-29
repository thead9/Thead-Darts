//
//  X01HitView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/29/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct X01HitView: View {

    @ObservedObject var x01Game: X01Game
    
    var onHit: () -> ()
    
    var body: some View {
        Group {
            if self.selectingMultiplier.0 {
                x01SelectingMultiplier
            } else {
                x01HitGrid
            }
        }
    }
    
    let wedgesArray: [[Wedge]] = [[.one, .two, .three, .four],
                                  [.five, .six, .seven, .eight],
                                  [.nine, .ten, .eleven, .twelve],
                                  [.thirteen, .fourteen, .fifteen, .sixteen],
                                  [.seventeen, .eightteen, .nineteen, .twenty],
                                  [.bull, .miss]]
    
    let hitViewRows: CGFloat = 6
    let hitViewcolumns: CGFloat = 4
    let hitViewSpacing: CGFloat = 10
    
    func getItemWidth(containerWidth: CGFloat) -> CGFloat {
        return (containerWidth - hitViewSpacing * (hitViewcolumns - 1)) / hitViewcolumns
    }
    
    func getItemHeight(containerHeight: CGFloat) -> CGFloat {
        return (containerHeight - hitViewSpacing * (hitViewcolumns - 1)) / hitViewRows
    }
    
    @State var selectingMultiplier: (Bool, Wedge) = (false, .one)
    
    func x01HitButtonAction(for wedge: Wedge) {
        if wedge == .miss {
            self.x01Game.scores[self.x01Game.scoreKeeper.activeIndex].hit(on: .miss)
        } else {
            self.selectingMultiplier = (true, wedge)
        }
    }
    
    func isBullOrMiss(wedge: Wedge) -> Bool {
        return wedge == .bull || wedge == .miss
    }
    
    var x01HitGrid: some View {
        GeometryReader { geometry in
            VStack(spacing: self.hitViewSpacing / 2) {
                ForEach(0..<self.wedgesArray.count, id: \.self) { rowIndex in
                    HStack(spacing: self.hitViewSpacing / 2) {
                        ForEach(self.wedgesArray[rowIndex]) { wedge in
                            Button(
                                action: {
                                    self.x01HitButtonAction(for: wedge)
                                }
                            ) {
                                if self.isBullOrMiss(wedge: wedge) {
                                    Text("\(wedge.name())")
                                } else {
                                    Text("\(wedge.rawValue)")
                                }
                            }
                            .frame(width: (self.isBullOrMiss(wedge: wedge) ? 2 : 1) * self.getItemWidth(containerWidth: geometry.size.width), height: self.getItemHeight(containerHeight: geometry.size.height))
                            .background(Color("HitBackground"))
                            .foregroundColor(Color("Secondary"))
                            .cornerRadius(25)
                            .addBorder(Color("Primary"), width: 2)
                            .disabled(!self.x01Game.scoreKeeper.activeTurn.canAddThrow())
                        }
                    }
                }
            }
        }
    }
    
    var x01SelectingMultiplier: some View {
        GeometryReader { geometry in
            VStack(spacing: 5) {
                Text("\(self.selectingMultiplier.1.abbreviation())")
                    .padding(.bottom)
                    .foregroundColor(Color("Primary"))
                                        
                Button(
                    action: {
                        self.x01Game.scores[self.x01Game.scoreKeeper.activeIndex].hit(on: self.selectingMultiplier.1, with: .single)
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
                        self.x01Game.scores[self.x01Game.scoreKeeper.activeIndex].hit(on: self.selectingMultiplier.1, with: .double)
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
                            self.x01Game.scores[self.x01Game.scoreKeeper.activeIndex].hit(on: self.selectingMultiplier.1, with: .triple)
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
            .padding()
        }
    }
}

struct X01HitView_Previews: PreviewProvider {
    static var previews: some View {
        X01HitView(x01Game: X01Game(numberOfPlayers: 2), onHit: { })
    }
}
