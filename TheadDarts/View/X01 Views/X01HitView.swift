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
    
    var animationTime = 0.25
    
    // MARK: Body
    var body: some View {
        Group {
            if self.selectingMultiplier.0 {
                x01SelectingMultiplier
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            } else if !self.x01Game.scoreKeeper.activeTurn.canAddThrow() {
                x01TurnOverview
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            } else {
                x01HitGrid
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            }
        }
    }
    
    // MARK: Hit Grid
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
                            Button(action: {
                                withAnimation(.easeInOut(duration: self.animationTime)) {
                                    self.x01HitButtonAction(for: wedge)
                                }
                            }) {
                                if self.isBullOrMiss(wedge: wedge) {
                                    Text("\(wedge.name())")
                                        .padding(.vertical)
                                        .frame(width: ( (self.isBullOrMiss(wedge: wedge) ? 2 : 1) * self.getItemWidth(containerWidth: geometry.size.width) ) + (self.isBullOrMiss(wedge: wedge) ? self.hitViewSpacing / 2 : 0), height: self.getItemHeight(containerHeight: geometry.size.height))
                                } else {
                                    Text("\(wedge.rawValue)")
                                        .padding(.vertical)
                                        .frame(width: ( (self.isBullOrMiss(wedge: wedge) ? 2 : 1) * self.getItemWidth(containerWidth: geometry.size.width) ) + (self.isBullOrMiss(wedge: wedge) ? self.hitViewSpacing / 2 : 0), height: self.getItemHeight(containerHeight: geometry.size.height))
                                }
                            }
                            .background(Color.select(.hitBackground))
                            .foregroundColor(Color.select(.secondary))
                            .cornerRadius(25)
                            .addBorder(Color.select(.primary), width: 2)
                            .disabled(!self.x01Game.scoreKeeper.activeTurn.canAddThrow())
                        }
                    }
                }
            }
        }
    }
    
    // MARK: Selecting Multiplier
    var x01SelectingMultiplier: some View {
        GeometryReader { geometry in
            VStack(spacing: 5) {
                Text("\(self.selectingMultiplier.1.abbreviation())")
                    .font(.largeTitle)
                    .foregroundColor(Color.select(.primary))
                                        
                Button(action: {
                    withAnimation(.easeInOut(duration: self.animationTime)) {
                        self.x01Game.scores[self.x01Game.scoreKeeper.activeIndex].hit(on: self.selectingMultiplier.1, with: .single)
                        self.selectingMultiplier = (false, .one)
                        self.onHit()
                    }
                }) {
                    Text("Single")
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.select(.secondary))
                .foregroundColor(Color.select(.background))
                .cornerRadius(25)
                
                Button(action: {
                    withAnimation(.easeInOut(duration: self.animationTime)) {
                        self.x01Game.scores[self.x01Game.scoreKeeper.activeIndex].hit(on: self.selectingMultiplier.1, with: .double)
                        self.selectingMultiplier = (false, .one)
                        self.onHit()
                    }
                }) {
                    Text("Double")
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.select(.secondary))
                .foregroundColor(Color.select(.background))
                .cornerRadius(25)
                
                if (self.selectingMultiplier.1 != .bull) {
                    Button(action: {
                        withAnimation(.easeInOut(duration: self.animationTime)) {
                            self.x01Game.scores[self.x01Game.scoreKeeper.activeIndex].hit(on: self.selectingMultiplier.1, with: .triple)
                            self.selectingMultiplier = (false, .one)
                            self.onHit()
                        }
                    }) {
                        Text("Triple")
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                    }
                    .background(Color.select(.secondary))
                    .foregroundColor(Color.select(.background))
                    .cornerRadius(25)
                }
                
                Button(action: {
                    withAnimation(.easeInOut(duration: self.animationTime)) {
                        self.selectingMultiplier = (false, .one)
                    }
                }) {
                    Text("Cancel")
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                }
                .background(Color(.gray))
                .foregroundColor(Color.select(.background))
                .cornerRadius(20)
            }
            .padding(.vertical)
            .padding(.horizontal, 10)
            .frame(width: geometry.size.width / 1.5)
            .background(Color.select(.hitBackground))
            .cornerRadius(25)
            .addBorder(Color.select(.primary), width: 2)
            .padding()
        }
    }
    
    // MARK: Turn Summary
    var x01TurnOverview: some View {
        GeometryReader { geometry in
            VStack() {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Turn Summary")
                        .padding()
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.select(.secondary))
                    
                    Rectangle()
                        .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                        .foregroundColor(Color.select(.primary))
                    
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(0..<self.x01Game.scoreKeeper!.activeTurn.dartThrows.count, id: \.self) { index in
                            HStack(spacing: 10) {
                                Text("Throw \(index + 1)")
                                Text("\(self.x01Game.scoreKeeper!.activeTurn.dartThrows[index].toString())")
                                    .foregroundColor(Color.select(.secondary))
                            }
                            .font(.title)
                            .padding(.horizontal)
                            .padding(.bottom)
                        }
                        
                        Rectangle()
                            .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                            .foregroundColor(Color.select(.primary))
                        
                        HStack(spacing: 10) {
                            Text("Scored")
                            Text("\(self.x01Game.scoreKeeper!.activeTurn.totalScore())")
                                .foregroundColor(Color.select(.secondary))
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        
                        HStack(spacing: 10) {
                            Text("Remaining")
                            Text("\(self.x01Game.scores[self.x01Game.scoreKeeper.activeIndex].points)")
                                .foregroundColor(Color.select(.secondary))
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    }
                    .padding(.vertical)
                }
                .cornerRadius(25)
                .addBorder(Color.select(.primary), width: 2)
                
                Button(action: {
                    withAnimation(.easeInOut(duration: self.animationTime)) {
                        self.x01Game.scoreKeeper.nextPlayer()
                    }
                }) {
                    Text("Next")
                        .padding()
                        .frame(maxWidth: geometry.size.width / 3)
                }
                .background(Color.select(.secondary))
                .foregroundColor(Color.select(.background))
                .cornerRadius(25)
                .padding(.top)
            }
            .padding(.horizontal)
        }
    }
}

struct X01HitView_Previews: PreviewProvider {
    static var previews: some View {
        X01HitView(x01Game: X01Game(numberOfPlayers: 2), onHit: { })
    }
}
