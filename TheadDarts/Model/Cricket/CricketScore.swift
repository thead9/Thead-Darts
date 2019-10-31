//
//  CricketScore.swift
//  TheadDarts
//
//  Created by Thomas Headley on 5/29/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

import Combine
import SwiftUI

class CricketScore: DartScore, ObservableObject {    
    var objectWillChange = PassthroughSubject<Void, Never>()
    var updated: () -> () = { }
    
    var scoreKeeper: CricketScoreKeeper = CricketScoreKeeper(playerUnits: [CricketPlayerUnit]())

    var marks: (
        fifteen: Int,
        sixteen: Int,
        seventeen: Int,
        eightteen: Int,
        nineteen: Int,
        twenty: Int,
        bull: Int) = (0, 0, 0, 0, 0, 0, 0) {
        didSet {
            updated()
            objectWillChange.send(())
        }
    }
    
    var points: Int {
        get {
            return (
                fifteenPoints +
                sixteenPoints +
                seventeenPoints +
                eightteenPoints +
                nineteenPoints +
                twentyPoints +
                bullPoints
            )
        }
    }
    
    var allClosed: Bool {
        get {
            if (
                !fifteenClosed ||
                !sixteenClosed ||
                !seventeenClosed ||
                !eighteenClosed ||
                !nineteenClosed ||
                !twentyClosed  ||
                !bullClosed
            ) {
                return false
            } else {
                return true
            }
        }
    }
    
    // MARK: Inits
    required init () { }

    init(updated: @escaping () -> ()) {
        self.updated = updated
    }
    
    func getMarks(for wedge: Wedge) -> Int {
        switch wedge {
        case .fifteen:
            return marks.fifteen
        case .sixteen:
            return marks.sixteen
        case .seventeen:
            return marks.seventeen
        case .eightteen:
            return marks.eightteen
        case .nineteen:
            return marks.nineteen
        case .twenty:
            return marks.twenty
        case .bull:
            return marks.bull
        default:
            return -1
        }
    }
    
    func isWedgeClosed(_ wedge: Wedge) -> Bool {
        return getMarks(for: wedge) >= 3
    }
}

// MARK: Access Marks
extension CricketScore {
    var fifteenPoints: Int {
        get { return marks.fifteen > 3 ? Wedge.fifteen.rawValue * (marks.fifteen-3) : 0 }
    }
    var sixteenPoints: Int {
        get { return marks.sixteen > 3 ? Wedge.sixteen.rawValue * (marks.sixteen-3) : 0 }
    }
    var seventeenPoints: Int {
        get { return marks.seventeen > 3 ? Wedge.seventeen.rawValue * (marks.seventeen-3) : 0 }
    }
    var eightteenPoints: Int {
        get { return marks.eightteen > 3 ? Wedge.eightteen.rawValue * (marks.eightteen-3) : 0 }
    }
    var nineteenPoints: Int {
        get { return marks.nineteen > 3 ? Wedge.nineteen.rawValue * (marks.nineteen-3) : 0 }
    }
    var twentyPoints: Int {
        get { return marks.twenty > 3 ? Wedge.twenty.rawValue * (marks.twenty-3) : 0 }
    }
    var bullPoints: Int {
        get { return marks.bull > 3 ? Wedge.bull.rawValue * (marks.bull-3) : 0 }
    }
    
    var fifteenClosed: Bool { get { return closed(wedge: .fifteen) } }
    var sixteenClosed: Bool { get { return closed(wedge: .sixteen) } }
    var seventeenClosed: Bool { get { return closed(wedge: .seventeen) } }
    var eighteenClosed: Bool { get { return closed(wedge: .eightteen) } }
    var nineteenClosed: Bool { get { return closed(wedge: .nineteen) } }
    var twentyClosed: Bool { get { return closed(wedge: .twenty) } }
    var bullClosed: Bool { get { return closed(wedge: .bull) } }
    
    func closed(wedge: Wedge) -> Bool {
        return getMarks(for: wedge) >= 3
    }
}

// MARK: Change Marks
extension CricketScore {
    func shouldAllowHit(on wedge: Wedge) -> Bool {
        return scoreKeeper.shouldAllowHit(on: wedge, for: self)
    }
    
    func shouldAllowScoring(on wedge: Wedge, with multiplier: Multiplier) -> Bool {
        return scoreKeeper.shouldAllowScoring(on: wedge, with: multiplier, for: self)
    }
    
    @discardableResult
    func hit(on wedge: Wedge, with multiplier: Multiplier) -> CricketScore {
        
        guard !(wedge == .bull && multiplier == .triple) else {
            return self
        }
        guard shouldAllowHit(on: wedge) else {
            return self
        }
        
        if wedge == .miss {
            scoreKeeper.hit(on: wedge, with: multiplier, for: self)
            return self
        }
        
        return registerHit(on: wedge, with: multiplier)
    }
    
    @discardableResult
    func registerHit(on wedge: Wedge, with multiplier: Multiplier) -> CricketScore {
        // All of the below need to occur in order to allow for proper logic evaluation
        // Only change the order if you know what you are doing
        let allowScoring = shouldAllowScoring(on: wedge, with: multiplier) || getMarks(for: wedge) + multiplier.rawValue < 3
        
        scoreKeeper.hit(on: wedge, with: multiplier, for: self)
        
        if allowScoring {
            switch wedge {
            case .fifteen:
                marks.fifteen += multiplier.rawValue
            case .sixteen:
                marks.sixteen += multiplier.rawValue
            case .seventeen:
                marks.seventeen += multiplier.rawValue
            case .eightteen:
                marks.eightteen += multiplier.rawValue
            case .nineteen:
                marks.nineteen += multiplier.rawValue
            case .twenty:
                marks.twenty += multiplier.rawValue
            case .bull:
                marks.bull += multiplier.rawValue
            default:
                return self
            }
        } else {
            switch wedge {
            case .fifteen:
                marks.fifteen = 3
            case .sixteen:
                marks.sixteen = 3
            case .seventeen:
                marks.seventeen = 3
            case .eightteen:
                marks.eightteen = 3
            case .nineteen:
                marks.nineteen = 3
            case .twenty:
                marks.twenty = 3
            case .bull:
                marks.bull = 3
            default:
                return self
            }
        }
        
        return self
    }
    
    @discardableResult
    func hit(on wedge: Wedge) -> CricketScore {
        self.hit(on: wedge, with: .single)
    }
    
    @discardableResult
    func undo(on wedge: Wedge, with multiplier: Multiplier) -> CricketScore {
        guard !(wedge == .bull && multiplier == .triple) else {
            return self
        }
        switch wedge {
        case .fifteen:
            marks.fifteen -= multiplier.rawValue
            marks.fifteen = marks.fifteen < 0 ? 0 : marks.fifteen
        case .sixteen:
            marks.sixteen -= multiplier.rawValue
            marks.sixteen = marks.sixteen < 0 ? 0 : marks.sixteen
        case .seventeen:
            marks.seventeen -= multiplier.rawValue
            marks.seventeen = marks.seventeen < 0 ? 0 : marks.seventeen
        case .eightteen:
            marks.eightteen -= multiplier.rawValue
            marks.eightteen = marks.eightteen < 0 ? 0 : marks.eightteen
        case .nineteen:
            marks.nineteen -= multiplier.rawValue
            marks.nineteen = marks.nineteen < 0 ? 0 : marks.nineteen
        case .twenty:
            marks.twenty -= multiplier.rawValue
            marks.twenty = marks.twenty < 0 ? 0 : marks.twenty
        case .bull:
            marks.bull -= multiplier.rawValue
            marks.bull = marks.bull < 0 ? 0 : marks.bull
        default:
            return self
        }
        return self
    }
    
    func reset() {
        marks = (0, 0, 0, 0, 0, 0, 0)
    }
}
