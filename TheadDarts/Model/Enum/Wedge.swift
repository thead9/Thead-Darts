//
//  Wedge.swift
//  TheadDarts
//
//  Created by Thomas Headley on 6/9/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

enum Wedge: Int, CaseIterable {
    case miss = 0
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case eleven = 11
    case twelve = 12
    case thirteen = 13
    case fourteen = 14
    case fifteen = 15
    case sixteen = 16
    case seventeen = 17
    case eightteen = 18
    case nineteen = 19
    case twenty = 20
    case bull = 25
    
    func name() -> String {
        switch self {
        case .miss:
            return "Miss"
        case .one:
            return "One"
        case .two:
            return "Two"
        case .three:
            return "Three"
        case .four:
            return "Four"
        case .five:
            return "Five"
        case .six:
            return "Six"
        case .seven:
            return "Seven"
        case .eight:
            return "Eight"
        case .nine:
            return "Nine"
        case .ten:
            return "Ten"
        case .eleven:
            return "Eleven"
        case .twelve:
            return "Twelve"
        case .thirteen:
            return "Thirteen"
        case .fourteen:
            return "Fourteen"
        case .fifteen:
            return "Fifteen"
        case .sixteen:
            return "Sixteen"
        case .seventeen:
            return "Seventeen"
        case .eightteen:
            return "Eightteen"
        case .nineteen:
            return "Nineteen"
        case .twenty:
            return "Twenty"
        case .bull:
            return "Bullseye"
        }
    }
    
    func abbreviation() -> String {
        switch self {
        case .miss:
            return "M"
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .ten:
            return "10"
        case .eleven:
            return "11"
        case .twelve:
            return "12"
        case .thirteen:
            return "13"
        case .fourteen:
            return "14"
        case .fifteen:
            return "15"
        case .sixteen:
            return "16"
        case .seventeen:
            return "17"
        case .eightteen:
            return "18"
        case .nineteen:
            return "19"
        case .twenty:
            return "20"
        case .bull:
            return "B"
        }
    }
}

extension Wedge: Identifiable {
    var id: Wedge { self }
}
