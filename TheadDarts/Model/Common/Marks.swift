//
//  Marks.swift
//  TheadDarts
//
//  Created by Thomas Headley on 10/31/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

struct Marks {
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
        bull: Int) = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    
    subscript(wedge: Wedge) -> Int {
        get {
            switch wedge {
            case .one:
                return marks.one
            case .two:
                return marks.two
            case .three:
                return marks.three
            case .four:
                return marks.four
            case .five:
                return marks.five
            case .six:
                return marks.six
            case .seven:
                return marks.seven
            case .eight:
                return marks.eight
            case .nine:
                return marks.nine
            case .ten:
                return marks.ten
            case .eleven:
                return marks.eleven
            case .twelve:
                return marks.twelve
            case .thirteen:
                return marks.thirteen
            case .fourteen:
                return marks.fourteen
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
            case .miss:
                return 0
            }
        }
        
        set {
            switch wedge {
            case .one:
                marks.one = newValue
            case .two:
                marks.two = newValue
            case .three:
                marks.three = newValue
            case .four:
                marks.four = newValue
            case .five:
                marks.five = newValue
            case .six:
                marks.six = newValue
            case .seven:
                marks.seven = newValue
            case .eight:
                marks.eight = newValue
            case .nine:
                marks.nine = newValue
            case .ten:
                marks.ten = newValue
            case .eleven:
                marks.eleven = newValue
            case .twelve:
                marks.twelve = newValue
            case .thirteen:
                marks.thirteen = newValue
            case .fourteen:
                marks.fourteen = newValue
            case .fifteen:
                marks.fifteen = newValue
            case .sixteen:
                marks.sixteen = newValue
            case .seventeen:
                marks.seventeen = newValue
            case .eightteen:
                marks.eightteen = newValue
            case .nineteen:
                marks.nineteen = newValue
            case .twenty:
                marks.twenty = newValue
            case .bull:
                marks.bull = newValue
            case .miss:
                break
            }
        }
    }
    
    func points(for wedge: Wedge) -> Int {
        return self[wedge] * wedge.rawValue
    }
    
    func totalPoints() -> Int {
        var total = 0
        for wedge in Wedge.allCases {
            total += points(for: wedge)
        }
        return total
    }
}
