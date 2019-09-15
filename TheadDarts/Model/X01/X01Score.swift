//
//  X01Score.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/15/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

import Combine
import SwiftUI

class X01Score: DartScore {
    var objectWillChange = PassthroughSubject<Void, Never>()
    var updated: () -> () = { }
    
    var startingPoint: Int = 301
    var points: Int {
        get {
            startingPoint -
            onePoints -
            twoPoints -
            threePoints -
            fourPoints -
            fivePoints -
            sixPoints -
            sevenPoints -
            eightPoints -
            ninePoints -
            tenPoints -
            elevenPoints -
            twelvePoints -
            thirteenPoints -
            fourteenPoints -
            fifteenPoints -
            sixteenPoints -
            seventeenPoints -
            eighteenPoints -
            nineteenPoints -
            twentyPoints -
            bullPoints
        }
    }
    
    var marks: (
        one: Int,
        two: Int,
        three: Int,
        four: Int,
        five: Int,
        six: Int,
        seven: Int,
        eight: Int,
        nine: Int,
        ten: Int,
        eleven: Int,
        twelve: Int,
        thirteen: Int,
        fourteen: Int,
        fifteen: Int,
        sixteen: Int,
        seventeen: Int,
        eightteen: Int,
        nineteen: Int,
        twenty: Int,
        bull: Int) = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0) {
        didSet {
            updated()
            objectWillChange.send(())
        }
    }
    
    // MARK: Inits
    init () { }

    init(startingPoint: Int = 301, updated: @escaping () -> ()) {
        self.startingPoint = startingPoint
        self.updated = updated
    }
    
    func shouldAllowHit(on: Wedge) -> Bool {
        // TODO:
        return true
    }
}

// MARK: Change Marks
extension X01Score {
    @discardableResult
    func hit(on wedge: Wedge, with multiplier: Multiplier) -> X01Score {
        guard !(wedge == .bull && multiplier == .triple) else {
            return self
        }
        guard shouldAllowHit(on: wedge) else {
            return self
        }
        
        return self
    }
    
    @discardableResult
    func undo(on wedge: Wedge, with multiplier: Multiplier) -> X01Score {
        return self
    }
}

// MARK: Access Marks
extension X01Score {
    var onePoints: Int {
        get { return Wedge.one.rawValue * marks.one }
    }
    var twoPoints: Int {
        get { return Wedge.two.rawValue * marks.two }
    }
    var threePoints: Int {
        get { return Wedge.three.rawValue * marks.three }
    }
    var fourPoints: Int {
        get { return Wedge.four.rawValue * marks.four }
    }
    var fivePoints: Int {
        get { return Wedge.five.rawValue * marks.five }
    }
    var sixPoints: Int {
        get { return Wedge.six.rawValue * marks.six }
    }
    var sevenPoints: Int {
        get { return Wedge.seven.rawValue * marks.seven }
    }
    var eightPoints: Int {
        get { return Wedge.eight.rawValue * marks.eight }
    }
    var ninePoints: Int {
        get { return Wedge.nine.rawValue * marks.nine }
    }
    var tenPoints: Int {
        get { return Wedge.ten.rawValue * marks.ten }
    }
    var elevenPoints: Int {
        get { return Wedge.eleven.rawValue * marks.eleven }
    }
    var twelvePoints: Int {
        get { return Wedge.twelve.rawValue * marks.twelve }
    }
    var thirteenPoints: Int {
        get { return Wedge.thirteen.rawValue * marks.thirteen }
    }
    var fourteenPoints: Int {
        get { return Wedge.fourteen.rawValue * marks.fourteen }
    }
    var fifteenPoints: Int {
        get { return Wedge.fifteen.rawValue * marks.fifteen }
    }
    var sixteenPoints: Int {
        get { return Wedge.sixteen.rawValue * marks.sixteen }
    }
    var seventeenPoints: Int {
        get { return Wedge.seventeen.rawValue * marks.seventeen }
    }
    var eighteenPoints: Int {
        get { return Wedge.eightteen.rawValue * marks.eightteen }
    }
    var nineteenPoints: Int {
        get { return Wedge.nineteen.rawValue * marks.nineteen }
    }
    var twentyPoints: Int {
        get { return Wedge.twenty.rawValue * marks.twenty }
    }
    var bullPoints: Int {
        get { return Wedge.bull.rawValue * marks.bull }
    }
}
