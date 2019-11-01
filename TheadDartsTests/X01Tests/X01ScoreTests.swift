//
//  X01StartingPoint.swift
//  TheadDartsTests
//
//  Created by Thomas Headley on 9/15/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

import XCTest
@testable import Darts

class X01ScoreTests: XCTestCase {
    
    var x01Score = X01Score()
    
    override func setUp() {
        x01Score = X01Score()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Inits
    func testDefaultInit() {
        x01Score = X01Score()
        
        XCTAssertEqual(x01Score.marks[.one], 0)
        XCTAssertEqual(x01Score.marks[.two], 0)
        XCTAssertEqual(x01Score.marks[.three], 0)
        XCTAssertEqual(x01Score.marks[.four], 0)
        XCTAssertEqual(x01Score.marks[.five], 0)
        XCTAssertEqual(x01Score.marks[.six], 0)
        XCTAssertEqual(x01Score.marks[.seven], 0)
        XCTAssertEqual(x01Score.marks[.eight], 0)
        XCTAssertEqual(x01Score.marks[.nine], 0)
        XCTAssertEqual(x01Score.marks[.ten], 0)
        XCTAssertEqual(x01Score.marks[.eleven], 0)
        XCTAssertEqual(x01Score.marks[.twelve], 0)
        XCTAssertEqual(x01Score.marks[.thirteen], 0)
        XCTAssertEqual(x01Score.marks[.fourteen], 0)
        XCTAssertEqual(x01Score.marks[.fifteen], 0)
        XCTAssertEqual(x01Score.marks[.sixteen], 0)
        XCTAssertEqual(x01Score.marks[.seventeen], 0)
        XCTAssertEqual(x01Score.marks[.eightteen], 0)
        XCTAssertEqual(x01Score.marks[.nineteen], 0)
        XCTAssertEqual(x01Score.marks[.twenty], 0)
        XCTAssertEqual(x01Score.marks[.bull], 0)
        
        XCTAssertEqual(x01Score.marks.points(for: .one), 0)
        XCTAssertEqual(x01Score.marks.points(for: .two), 0)
        XCTAssertEqual(x01Score.marks.points(for: .three), 0)
        XCTAssertEqual(x01Score.marks.points(for: .four), 0)
        XCTAssertEqual(x01Score.marks.points(for: .five), 0)
        XCTAssertEqual(x01Score.marks.points(for: .six), 0)
        XCTAssertEqual(x01Score.marks.points(for: .seven), 0)
        XCTAssertEqual(x01Score.marks.points(for: .eight), 0)
        XCTAssertEqual(x01Score.marks.points(for: .nine), 0)
        XCTAssertEqual(x01Score.marks.points(for: .ten), 0)
        XCTAssertEqual(x01Score.marks.points(for: .eleven), 0)
        XCTAssertEqual(x01Score.marks.points(for: .twelve), 0)
        XCTAssertEqual(x01Score.marks.points(for: .thirteen), 0)
        XCTAssertEqual(x01Score.marks.points(for: .fourteen), 0)
        XCTAssertEqual(x01Score.marks.points(for: .fifteen), 0)
        XCTAssertEqual(x01Score.marks.points(for: .sixteen), 0)
        XCTAssertEqual(x01Score.marks.points(for: .seventeen), 0)
        XCTAssertEqual(x01Score.marks.points(for: .eightteen), 0)
        XCTAssertEqual(x01Score.marks.points(for: .nineteen), 0)
        XCTAssertEqual(x01Score.marks.points(for: .twenty), 0)
        XCTAssertEqual(x01Score.marks.points(for: .bull), 0)
        
        XCTAssertEqual(x01Score.startingPoint, 301)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testDifferentStartingPoint() {
        x01Score = X01Score(startingPoint: 401)
        
        XCTAssertEqual(x01Score.startingPoint, 401)
        XCTAssertEqual(x01Score.points, 401)
    }
    
    // MARK: Hits
    func testHitOneSingle() {
        x01Score.hit(on: .one, with: .single)
        
        XCTAssertEqual(x01Score.marks[.one], 1)
        XCTAssertEqual(x01Score.marks.points(for: .one), 1)
        XCTAssertEqual(x01Score.points, 300)
    }
    
    func testHitOneDouble() {
        x01Score.hit(on: .one, with: .double)
        
        XCTAssertEqual(x01Score.marks[.one], 2)
        XCTAssertEqual(x01Score.marks.points(for: .one), 2)
        XCTAssertEqual(x01Score.points, 299)
    }
    
    func testHitOneTriple() {
        x01Score.hit(on: .one, with: .triple)
        
        XCTAssertEqual(x01Score.marks[.one], 3)
        XCTAssertEqual(x01Score.marks.points(for: .one), 3)
        XCTAssertEqual(x01Score.points, 298)
    }
    
    func testHitTwoSingle() {
        x01Score.hit(on: .two, with: .single)
        
        XCTAssertEqual(x01Score.marks[.two], 1)
        XCTAssertEqual(x01Score.marks.points(for: .two), 2)
        XCTAssertEqual(x01Score.points, 299)
    }
    
    func testHitTwoDouble() {
        x01Score.hit(on: .two, with: .double)

        XCTAssertEqual(x01Score.marks[.two], 2)
        XCTAssertEqual(x01Score.marks.points(for: .two), 4)
        XCTAssertEqual(x01Score.points, 297)
    }
    
    func testHitTwoTriple() {
        x01Score.hit(on: .two, with: .triple)

        XCTAssertEqual(x01Score.marks[.two], 3)
        XCTAssertEqual(x01Score.marks.points(for: .two), 6)
        XCTAssertEqual(x01Score.points, 295)
    }
    
    func testHitThreeSingle() {
        x01Score.hit(on: .three, with: .single)
        
        XCTAssertEqual(x01Score.marks[.three], 1)
        XCTAssertEqual(x01Score.marks.points(for: .three), 3)
        XCTAssertEqual(x01Score.points, 298)
    }
    
    func testHitThreeDouble() {
        x01Score.hit(on: .three, with: .double)

        XCTAssertEqual(x01Score.marks[.three], 2)
        XCTAssertEqual(x01Score.marks.points(for: .three), 6)
        XCTAssertEqual(x01Score.points, 295)
    }
    
    func testHitThreeTriple() {
        x01Score.hit(on: .three, with: .triple)

        XCTAssertEqual(x01Score.marks[.three], 3)
        XCTAssertEqual(x01Score.marks.points(for: .three), 9)
        XCTAssertEqual(x01Score.points, 292)
    }
    
    func testHitFourSingle() {
        x01Score.hit(on: .four, with: .single)
        
        XCTAssertEqual(x01Score.marks[.four], 1)
        XCTAssertEqual(x01Score.marks.points(for: .four), 4)
        XCTAssertEqual(x01Score.points, 297)
    }
    
    func testHitFourDouble() {
        x01Score.hit(on: .four, with: .double)

        XCTAssertEqual(x01Score.marks[.four], 2)
        XCTAssertEqual(x01Score.marks.points(for: .four), 8)
        XCTAssertEqual(x01Score.points, 293)
    }
    
    func testHitFourTriple() {
        x01Score.hit(on: .four, with: .triple)

        XCTAssertEqual(x01Score.marks[.four], 3)
        XCTAssertEqual(x01Score.marks.points(for: .four), 12)
        XCTAssertEqual(x01Score.points, 289)
    }
    
    func testHitFiveSingle() {
        x01Score.hit(on: .five, with: .single)
        
        XCTAssertEqual(x01Score.marks[.five], 1)
        XCTAssertEqual(x01Score.marks.points(for: .five), 5)
        XCTAssertEqual(x01Score.points, 296)
    }
    
    func testHitFiveDouble() {
        x01Score.hit(on: .five, with: .double)

        XCTAssertEqual(x01Score.marks[.five], 2)
        XCTAssertEqual(x01Score.marks.points(for: .five), 10)
        XCTAssertEqual(x01Score.points, 291)
    }
    
    func testHitFiveTriple() {
        x01Score.hit(on: .five, with: .triple)

        XCTAssertEqual(x01Score.marks[.five], 3)
        XCTAssertEqual(x01Score.marks.points(for: .five), 15)
        XCTAssertEqual(x01Score.points, 286)
    }
    
    func testHitSixSingle() {
        x01Score.hit(on: .six, with: .single)
        
        XCTAssertEqual(x01Score.marks[.six], 1)
        XCTAssertEqual(x01Score.marks.points(for: .six), 6)
        XCTAssertEqual(x01Score.points, 295)
    }
    
    func testHitSixDouble() {
        x01Score.hit(on: .six, with: .double)

        XCTAssertEqual(x01Score.marks[.six], 2)
        XCTAssertEqual(x01Score.marks.points(for: .six), 12)
        XCTAssertEqual(x01Score.points, 289)
    }
    
    func testHitSixTriple() {
        x01Score.hit(on: .six, with: .triple)

        XCTAssertEqual(x01Score.marks[.six], 3)
        XCTAssertEqual(x01Score.marks.points(for: .six), 18)
        XCTAssertEqual(x01Score.points, 283)
    }
    
    func testHitSevenSingle() {
        x01Score.hit(on: .seven, with: .single)
        
        XCTAssertEqual(x01Score.marks[.seven], 1)
        XCTAssertEqual(x01Score.marks.points(for: .seven), 7)
        XCTAssertEqual(x01Score.points, 294)
    }
    
    func testHitSevenDouble() {
        x01Score.hit(on: .seven, with: .double)

        XCTAssertEqual(x01Score.marks[.seven], 2)
        XCTAssertEqual(x01Score.marks.points(for: .seven), 14)
        XCTAssertEqual(x01Score.points, 287)
    }
    
    func testHitSevenTriple() {
        x01Score.hit(on: .seven, with: .triple)

        XCTAssertEqual(x01Score.marks[.seven], 3)
        XCTAssertEqual(x01Score.marks.points(for: .seven), 21)
        XCTAssertEqual(x01Score.points, 280)
    }
    
    func testHitEightSingle() {
        x01Score.hit(on: .eight, with: .single)
        
        XCTAssertEqual(x01Score.marks[.eight], 1)
        XCTAssertEqual(x01Score.marks.points(for: .eight), 8)
        XCTAssertEqual(x01Score.points, 293)
    }
    
    func testHitEightDouble() {
        x01Score.hit(on: .eight, with: .double)

        XCTAssertEqual(x01Score.marks[.eight], 2)
        XCTAssertEqual(x01Score.marks.points(for: .eight), 16)
        XCTAssertEqual(x01Score.points, 285)
    }
    
    func testHitEightTriple() {
        x01Score.hit(on: .eight, with: .triple)

        XCTAssertEqual(x01Score.marks[.eight], 3)
        XCTAssertEqual(x01Score.marks.points(for: .eight), 24)
        XCTAssertEqual(x01Score.points, 277)
    }
    
    func testHitNineSingle() {
        x01Score.hit(on: .nine, with: .single)
        
        XCTAssertEqual(x01Score.marks[.nine], 1)
        XCTAssertEqual(x01Score.marks.points(for: .nine), 9)
        XCTAssertEqual(x01Score.points, 292)
    }
    
    func testHitNineDouble() {
        x01Score.hit(on: .nine, with: .double)

        XCTAssertEqual(x01Score.marks[.nine], 2)
        XCTAssertEqual(x01Score.marks.points(for: .nine), 18)
        XCTAssertEqual(x01Score.points, 283)
    }
    
    func testHitNineTriple() {
        x01Score.hit(on: .nine, with: .triple)

        XCTAssertEqual(x01Score.marks[.nine], 3)
        XCTAssertEqual(x01Score.marks.points(for: .nine), 27)
        XCTAssertEqual(x01Score.points, 274)
    }
    
    func testHitTenSingle() {
        x01Score.hit(on: .ten, with: .single)
        
        XCTAssertEqual(x01Score.marks[.ten], 1)
        XCTAssertEqual(x01Score.marks.points(for: .ten), 10)
        XCTAssertEqual(x01Score.points, 291)
    }
    
    func testHitTenDouble() {
        x01Score.hit(on: .ten, with: .double)

        XCTAssertEqual(x01Score.marks[.ten], 2)
        XCTAssertEqual(x01Score.marks.points(for: .ten), 20)
        XCTAssertEqual(x01Score.points, 281)
    }
    
    func testHitTenTriple() {
        x01Score.hit(on: .ten, with: .triple)

        XCTAssertEqual(x01Score.marks[.ten], 3)
        XCTAssertEqual(x01Score.marks.points(for: .ten), 30)
        XCTAssertEqual(x01Score.points, 271)
    }
    
    func testHitElevenSingle() {
        x01Score.hit(on: .eleven, with: .single)
        
        XCTAssertEqual(x01Score.marks[.eleven], 1)
        XCTAssertEqual(x01Score.marks.points(for: .eleven), 11)
        XCTAssertEqual(x01Score.points, 290)
    }
    
    func testHitElevenDouble() {
        x01Score.hit(on: .eleven, with: .double)

        XCTAssertEqual(x01Score.marks[.eleven], 2)
        XCTAssertEqual(x01Score.marks.points(for: .eleven), 22)
        XCTAssertEqual(x01Score.points, 279)
    }
    
    func testHitElevenTriple() {
        x01Score.hit(on: .eleven, with: .triple)

        XCTAssertEqual(x01Score.marks[.eleven], 3)
        XCTAssertEqual(x01Score.marks.points(for: .eleven), 33)
        XCTAssertEqual(x01Score.points, 268)
    }
    
    func testHitTwelveSingle() {
        x01Score.hit(on: .twelve, with: .single)
        
        XCTAssertEqual(x01Score.marks[.twelve], 1)
        XCTAssertEqual(x01Score.marks.points(for: .twelve), 12)
        XCTAssertEqual(x01Score.points, 289)
    }
    
    func testHitTwelveDouble() {
        x01Score.hit(on: .twelve, with: .double)

        XCTAssertEqual(x01Score.marks[.twelve], 2)
        XCTAssertEqual(x01Score.marks.points(for: .twelve), 24)
        XCTAssertEqual(x01Score.points, 277)
    }
    
    func testHitTwelveTriple() {
        x01Score.hit(on: .twelve, with: .triple)

        XCTAssertEqual(x01Score.marks[.twelve], 3)
        XCTAssertEqual(x01Score.marks.points(for: .twelve), 36)
        XCTAssertEqual(x01Score.points, 265)
    }
    
    func testHitThirteenSingle() {
        x01Score.hit(on: .thirteen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.thirteen], 1)
        XCTAssertEqual(x01Score.marks.points(for: .thirteen), 13)
        XCTAssertEqual(x01Score.points, 288)
    }
    
    func testHitThirteenDouble() {
        x01Score.hit(on: .thirteen, with: .double)

        XCTAssertEqual(x01Score.marks[.thirteen], 2)
        XCTAssertEqual(x01Score.marks.points(for: .thirteen), 26)
        XCTAssertEqual(x01Score.points, 275)
    }
    
    func testHitThirteenTriple() {
        x01Score.hit(on: .thirteen, with: .triple)

        XCTAssertEqual(x01Score.marks[.thirteen], 3)
        XCTAssertEqual(x01Score.marks.points(for: .thirteen), 39)
        XCTAssertEqual(x01Score.points, 262)
    }
    
    func testHitFourteenSingle() {
        x01Score.hit(on: .fourteen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.fourteen], 1)
        XCTAssertEqual(x01Score.marks.points(for: .fourteen), 14)
        XCTAssertEqual(x01Score.points, 287)
    }
    
    func testHitFourteenDouble() {
        x01Score.hit(on: .fourteen, with: .double)

        XCTAssertEqual(x01Score.marks[.fourteen], 2)
        XCTAssertEqual(x01Score.marks.points(for: .fourteen), 28)
        XCTAssertEqual(x01Score.points, 273)
    }
    
    func testHitFourteenTriple() {
        x01Score.hit(on: .fourteen, with: .triple)

        XCTAssertEqual(x01Score.marks[.fourteen], 3)
        XCTAssertEqual(x01Score.marks.points(for: .fourteen), 42)
        XCTAssertEqual(x01Score.points, 259)
    }
    
    func testHitFifteenSingle() {
        x01Score.hit(on: .fifteen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.fifteen], 1)
        XCTAssertEqual(x01Score.marks.points(for: .fifteen), 15)
        XCTAssertEqual(x01Score.points, 286)
    }
    
    func testHitFifteenDouble() {
        x01Score.hit(on: .fifteen, with: .double)

        XCTAssertEqual(x01Score.marks[.fifteen], 2)
        XCTAssertEqual(x01Score.marks.points(for: .fifteen), 30)
        XCTAssertEqual(x01Score.points, 271)
    }
    
    func testHitFifteenTriple() {
        x01Score.hit(on: .fifteen, with: .triple)

        XCTAssertEqual(x01Score.marks[.fifteen], 3)
        XCTAssertEqual(x01Score.marks.points(for: .fifteen), 45)
        XCTAssertEqual(x01Score.points, 256)
    }
    
    func testHitSixteenSingle() {
        x01Score.hit(on: .sixteen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.sixteen], 1)
        XCTAssertEqual(x01Score.marks.points(for: .sixteen), 16)
        XCTAssertEqual(x01Score.points, 285)
    }
    
    func testHitSixteenDouble() {
        x01Score.hit(on: .sixteen, with: .double)

        XCTAssertEqual(x01Score.marks[.sixteen], 2)
        XCTAssertEqual(x01Score.marks.points(for: .sixteen), 32)
        XCTAssertEqual(x01Score.points, 269)
    }
    
    func testHitSixteenTriple() {
        x01Score.hit(on: .sixteen, with: .triple)

        XCTAssertEqual(x01Score.marks[.sixteen], 3)
        XCTAssertEqual(x01Score.marks.points(for: .sixteen), 48)
        XCTAssertEqual(x01Score.points, 253)
    }
    
    func testHitSeventeenSingle() {
        x01Score.hit(on: .seventeen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.seventeen], 1)
        XCTAssertEqual(x01Score.marks.points(for: .seventeen), 17)
        XCTAssertEqual(x01Score.points, 284)
    }
    
    func testHitSeventeenDouble() {
        x01Score.hit(on: .seventeen, with: .double)

        XCTAssertEqual(x01Score.marks[.seventeen], 2)
        XCTAssertEqual(x01Score.marks.points(for: .seventeen), 34)
        XCTAssertEqual(x01Score.points, 267)
    }
    
    func testHitSeventeenTriple() {
        x01Score.hit(on: .seventeen, with: .triple)

        XCTAssertEqual(x01Score.marks[.seventeen], 3)
        XCTAssertEqual(x01Score.marks.points(for: .seventeen), 51)
        XCTAssertEqual(x01Score.points, 250)
    }
    
    func testHitEighteenSingle() {
        x01Score.hit(on: .eightteen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.eightteen], 1)
        XCTAssertEqual(x01Score.marks.points(for: .eightteen), 18)
        XCTAssertEqual(x01Score.points, 283)
    }
    
    func testHitEighteenDouble() {
        x01Score.hit(on: .eightteen, with: .double)

        XCTAssertEqual(x01Score.marks[.eightteen], 2)
        XCTAssertEqual(x01Score.marks.points(for: .eightteen), 36)
        XCTAssertEqual(x01Score.points, 265)
    }
    
    func testHitEighteenTriple() {
        x01Score.hit(on: .eightteen, with: .triple)

        XCTAssertEqual(x01Score.marks[.eightteen], 3)
        XCTAssertEqual(x01Score.marks.points(for: .eightteen), 54)
        XCTAssertEqual(x01Score.points, 247)
    }
    
    func testHitNineteenSingle() {
        x01Score.hit(on: .nineteen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.nineteen], 1)
        XCTAssertEqual(x01Score.marks.points(for: .nineteen), 19)
        XCTAssertEqual(x01Score.points, 282)
    }
    
    func testHitNineteenDouble() {
        x01Score.hit(on: .nineteen, with: .double)

        XCTAssertEqual(x01Score.marks[.nineteen], 2)
        XCTAssertEqual(x01Score.marks.points(for: .nineteen), 38)
        XCTAssertEqual(x01Score.points, 263)
    }
    
    func testHitNineteenTriple() {
        x01Score.hit(on: .nineteen, with: .triple)

        XCTAssertEqual(x01Score.marks[.nineteen], 3)
        XCTAssertEqual(x01Score.marks.points(for: .nineteen), 57)
        XCTAssertEqual(x01Score.points, 244)
    }
    
    func testHitTwentySingle() {
        x01Score.hit(on: .twenty, with: .single)
        
        XCTAssertEqual(x01Score.marks[.twenty], 1)
        XCTAssertEqual(x01Score.marks.points(for: .twenty), 20)
        XCTAssertEqual(x01Score.points, 281)
    }
    
    func testHitTwentyDouble() {
        x01Score.hit(on: .twenty, with: .double)

        XCTAssertEqual(x01Score.marks[.twenty], 2)
        XCTAssertEqual(x01Score.marks.points(for: .twenty), 40)
        XCTAssertEqual(x01Score.points, 261)
    }
    
    func testHitTwentyTriple() {
        x01Score.hit(on: .twenty, with: .triple)

        XCTAssertEqual(x01Score.marks[.twenty], 3)
        XCTAssertEqual(x01Score.marks.points(for: .twenty), 60)
        XCTAssertEqual(x01Score.points, 241)
    }
    
    func testHitBullSingle() {
        x01Score.hit(on: .bull, with: .single)
        
        XCTAssertEqual(x01Score.marks[.bull], 1)
        XCTAssertEqual(x01Score.marks.points(for: .bull), 25)
        XCTAssertEqual(x01Score.points, 276)
    }
    
    func testHitBullDouble() {
        x01Score.hit(on: .bull, with: .double)

        XCTAssertEqual(x01Score.marks[.bull], 2)
        XCTAssertEqual(x01Score.marks.points(for: .bull), 50)
        XCTAssertEqual(x01Score.points, 251)
    }
    
    func testHitBullTriple() {
        x01Score.hit(on: .bull, with: .triple)

        XCTAssertEqual(x01Score.marks[.bull], 0)
        XCTAssertEqual(x01Score.marks.points(for: .bull), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testBust() {
        x01Score.startingPoint = 1
        x01Score.hit(on: .bull, with: .single)
        
        XCTAssertEqual(x01Score.points, 1)
    }
    
    // MARK: Undos
    func testUndoOneSingle() {
        x01Score.hit(on: .one, with: .single)
        x01Score.undo(on: .one, with: .single)
        
        XCTAssertEqual(x01Score.marks[.one], 0)
        XCTAssertEqual(x01Score.marks.points(for: .one), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoOneDouble() {
        x01Score.hit(on: .one, with: .double)
        x01Score.undo(on: .one, with: .double)
        
        XCTAssertEqual(x01Score.marks[.one], 0)
        XCTAssertEqual(x01Score.marks.points(for: .one), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoOneTriple() {
        x01Score.hit(on: .one, with: .triple)
        x01Score.undo(on: .one, with: .triple)
        
        XCTAssertEqual(x01Score.marks[.one], 0)
        XCTAssertEqual(x01Score.marks.points(for: .one), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoTwoSingle() {
        x01Score.hit(on: .two, with: .single)
        x01Score.undo(on: .two, with: .single)
        
        XCTAssertEqual(x01Score.marks[.two], 0)
        XCTAssertEqual(x01Score.marks.points(for: .two), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoTwoDouble() {
        x01Score.hit(on: .two, with: .double)
        x01Score.undo(on: .two, with: .double)

        XCTAssertEqual(x01Score.marks[.two], 0)
        XCTAssertEqual(x01Score.marks.points(for: .two), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoTwoTriple() {
        x01Score.hit(on: .two, with: .triple)
        x01Score.undo(on: .two, with: .triple)

        XCTAssertEqual(x01Score.marks[.two], 0)
        XCTAssertEqual(x01Score.marks.points(for: .two), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoThreeSingle() {
        x01Score.hit(on: .three, with: .single)
        x01Score.undo(on: .three, with: .single)
        
        XCTAssertEqual(x01Score.marks[.three], 0)
        XCTAssertEqual(x01Score.marks.points(for: .three), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoThreeDouble() {
        x01Score.hit(on: .three, with: .double)
        x01Score.undo(on: .three, with: .double)

        XCTAssertEqual(x01Score.marks[.three], 0)
        XCTAssertEqual(x01Score.marks.points(for: .three), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoThreeTriple() {
        x01Score.hit(on: .three, with: .triple)
        x01Score.undo(on: .three, with: .triple)

        XCTAssertEqual(x01Score.marks[.three], 0)
        XCTAssertEqual(x01Score.marks.points(for: .three), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoFourSingle() {
        x01Score.hit(on: .four, with: .single)
        x01Score.undo(on: .four, with: .single)
        
        XCTAssertEqual(x01Score.marks[.four], 0)
        XCTAssertEqual(x01Score.marks.points(for: .four), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoFourDouble() {
        x01Score.hit(on: .four, with: .double)
        x01Score.undo(on: .four, with: .double)

        XCTAssertEqual(x01Score.marks[.four], 0)
        XCTAssertEqual(x01Score.marks.points(for: .four), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoFourTriple() {
        x01Score.hit(on: .four, with: .triple)
        x01Score.undo(on: .four, with: .triple)

        XCTAssertEqual(x01Score.marks[.four], 0)
        XCTAssertEqual(x01Score.marks.points(for: .four), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoFiveSingle() {
        x01Score.hit(on: .five, with: .single)
        x01Score.undo(on: .five, with: .single)
        
        XCTAssertEqual(x01Score.marks[.five], 0)
        XCTAssertEqual(x01Score.marks.points(for: .five), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoFiveDouble() {
        x01Score.hit(on: .five, with: .double)
        x01Score.undo(on: .five, with: .double)

        XCTAssertEqual(x01Score.marks[.five], 0)
        XCTAssertEqual(x01Score.marks.points(for: .five), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoFiveTriple() {
        x01Score.hit(on: .five, with: .triple)
        x01Score.undo(on: .five, with: .triple)

        XCTAssertEqual(x01Score.marks[.five], 0)
        XCTAssertEqual(x01Score.marks.points(for: .five), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoSixSingle() {
        x01Score.hit(on: .six, with: .single)
        x01Score.undo(on: .six, with: .single)
        
        XCTAssertEqual(x01Score.marks[.six], 0)
        XCTAssertEqual(x01Score.marks.points(for: .six), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoSixDouble() {
        x01Score.hit(on: .six, with: .double)
        x01Score.undo(on: .six, with: .double)

        XCTAssertEqual(x01Score.marks[.six], 0)
        XCTAssertEqual(x01Score.marks.points(for: .six), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoSixTriple() {
        x01Score.hit(on: .six, with: .triple)
        x01Score.undo(on: .six, with: .triple)

        XCTAssertEqual(x01Score.marks[.six], 0)
        XCTAssertEqual(x01Score.marks.points(for: .six), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoSevenSingle() {
        x01Score.hit(on: .seven, with: .single)
        x01Score.undo(on: .seven, with: .single)
        
        XCTAssertEqual(x01Score.marks[.seven], 0)
        XCTAssertEqual(x01Score.marks.points(for: .seven), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoSevenDouble() {
        x01Score.hit(on: .seven, with: .double)
        x01Score.undo(on: .seven, with: .double)

        XCTAssertEqual(x01Score.marks[.seven], 0)
        XCTAssertEqual(x01Score.marks.points(for: .seven), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoSevenTriple() {
        x01Score.hit(on: .seven, with: .triple)
        x01Score.undo(on: .seven, with: .triple)

        XCTAssertEqual(x01Score.marks[.seven], 0)
        XCTAssertEqual(x01Score.marks.points(for: .seven), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoEightSingle() {
        x01Score.hit(on: .eight, with: .single)
        x01Score.undo(on: .eight, with: .single)
        
        XCTAssertEqual(x01Score.marks[.eight], 0)
        XCTAssertEqual(x01Score.marks.points(for: .eight), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoEightDouble() {
        x01Score.hit(on: .eight, with: .double)
        x01Score.undo(on: .eight, with: .double)

        XCTAssertEqual(x01Score.marks[.eight], 0)
        XCTAssertEqual(x01Score.marks.points(for: .eight), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoEightTriple() {
        x01Score.hit(on: .eight, with: .triple)
        x01Score.undo(on: .eight, with: .triple)

        XCTAssertEqual(x01Score.marks[.eight], 0)
        XCTAssertEqual(x01Score.marks.points(for: .eight), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoNineSingle() {
        x01Score.hit(on: .nine, with: .single)
        x01Score.undo(on: .nine, with: .single)
        
        XCTAssertEqual(x01Score.marks[.nine], 0)
        XCTAssertEqual(x01Score.marks.points(for: .nine), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoNineDouble() {
        x01Score.hit(on: .nine, with: .double)
        x01Score.undo(on: .nine, with: .double)

        XCTAssertEqual(x01Score.marks[.nine], 0)
        XCTAssertEqual(x01Score.marks.points(for: .nine), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoNineTriple() {
        x01Score.hit(on: .nine, with: .triple)
        x01Score.undo(on: .nine, with: .triple)

        XCTAssertEqual(x01Score.marks[.nine], 0)
        XCTAssertEqual(x01Score.marks.points(for: .nine), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoTenSingle() {
        x01Score.hit(on: .ten, with: .single)
        x01Score.undo(on: .ten, with: .single)
        
        XCTAssertEqual(x01Score.marks[.ten], 0)
        XCTAssertEqual(x01Score.marks.points(for: .ten), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoTenDouble() {
        x01Score.hit(on: .ten, with: .double)
        x01Score.undo(on: .ten, with: .double)

        XCTAssertEqual(x01Score.marks[.ten], 0)
        XCTAssertEqual(x01Score.marks.points(for: .ten), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoTenTriple() {
        x01Score.hit(on: .ten, with: .triple)
        x01Score.undo(on: .ten, with: .triple)

        XCTAssertEqual(x01Score.marks[.ten], 0)
        XCTAssertEqual(x01Score.marks.points(for: .ten), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoElevenSingle() {
        x01Score.hit(on: .eleven, with: .single)
        x01Score.undo(on: .eleven, with: .single)
        
        XCTAssertEqual(x01Score.marks[.eleven], 0)
        XCTAssertEqual(x01Score.marks.points(for: .eleven), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoElevenDouble() {
        x01Score.hit(on: .eleven, with: .double)
        x01Score.undo(on: .eleven, with: .double)

        XCTAssertEqual(x01Score.marks[.eleven], 0)
        XCTAssertEqual(x01Score.marks.points(for: .eleven), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoElevenTriple() {
        x01Score.hit(on: .eleven, with: .triple)
        x01Score.undo(on: .eleven, with: .triple)
                
        XCTAssertEqual(x01Score.marks[.eleven], 0)
        XCTAssertEqual(x01Score.marks.points(for: .eleven), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoTwelveSingle() {
        x01Score.hit(on: .twelve, with: .single)
        x01Score.undo(on: .twelve, with: .single)
        
        XCTAssertEqual(x01Score.marks[.twelve], 0)
        XCTAssertEqual(x01Score.marks.points(for: .twelve), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoTwelveDouble() {
        x01Score.hit(on: .twelve, with: .double)
        x01Score.undo(on: .twelve, with: .double)

        XCTAssertEqual(x01Score.marks[.twelve], 0)
        XCTAssertEqual(x01Score.marks.points(for: .twelve), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoTwelveTriple() {
        x01Score.hit(on: .twelve, with: .triple)
        x01Score.undo(on: .twelve, with: .triple)

        XCTAssertEqual(x01Score.marks[.twelve], 0)
        XCTAssertEqual(x01Score.marks.points(for: .twelve), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoThirteenSingle() {
        x01Score.hit(on: .thirteen, with: .single)
        x01Score.undo(on: .thirteen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.thirteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .thirteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoThirteenDouble() {
        x01Score.hit(on: .thirteen, with: .double)
        x01Score.undo(on: .thirteen, with: .double)

        XCTAssertEqual(x01Score.marks[.thirteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .thirteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoThirteenTriple() {
        x01Score.hit(on: .thirteen, with: .triple)
        x01Score.undo(on: .thirteen, with: .triple)

        XCTAssertEqual(x01Score.marks[.thirteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .thirteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoFourteenSingle() {
        x01Score.hit(on: .fourteen, with: .single)
        x01Score.undo(on: .fourteen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.fourteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .fourteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoFourteenDouble() {
        x01Score.hit(on: .fourteen, with: .double)
        x01Score.undo(on: .fourteen, with: .double)

        XCTAssertEqual(x01Score.marks[.fourteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .fourteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoFourteenTriple() {
        x01Score.hit(on: .fourteen, with: .triple)
        x01Score.undo(on: .fourteen, with: .triple)

        XCTAssertEqual(x01Score.marks[.fourteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .fourteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoFifteenSingle() {
        x01Score.hit(on: .fifteen, with: .single)
        x01Score.undo(on: .fifteen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.fifteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .fifteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoFifteenDouble() {
        x01Score.hit(on: .fifteen, with: .double)
        x01Score.undo(on: .fifteen, with: .double)

        XCTAssertEqual(x01Score.marks[.fifteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .fifteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoFifteenTriple() {
        x01Score.hit(on: .fifteen, with: .triple)
        x01Score.undo(on: .fifteen, with: .triple)

        XCTAssertEqual(x01Score.marks[.fifteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .fifteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoSixteenSingle() {
        x01Score.hit(on: .sixteen, with: .single)
        x01Score.undo(on: .sixteen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.sixteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .sixteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoSixteenDouble() {
        x01Score.hit(on: .sixteen, with: .double)
        x01Score.undo(on: .sixteen, with: .double)

        XCTAssertEqual(x01Score.marks[.sixteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .sixteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoSixteenTriple() {
        x01Score.hit(on: .sixteen, with: .triple)
        x01Score.undo(on: .sixteen, with: .triple)

        XCTAssertEqual(x01Score.marks[.sixteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .sixteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoSeventeenSingle() {
        x01Score.hit(on: .seventeen, with: .single)
        x01Score.undo(on: .seventeen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.seventeen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .seventeen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoSeventeenDouble() {
        x01Score.hit(on: .seventeen, with: .double)
        x01Score.undo(on: .seventeen, with: .double)

        XCTAssertEqual(x01Score.marks[.seventeen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .seventeen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoSeventeenTriple() {
        x01Score.hit(on: .seventeen, with: .triple)
        x01Score.undo(on: .seventeen, with: .triple)

        XCTAssertEqual(x01Score.marks[.seventeen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .seventeen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoEighteenSingle() {
        x01Score.hit(on: .eightteen, with: .single)
        x01Score.undo(on: .eightteen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.eightteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .eightteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoEighteenDouble() {
        x01Score.hit(on: .eightteen, with: .double)
        x01Score.undo(on: .eightteen, with: .double)

        XCTAssertEqual(x01Score.marks[.eightteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .eightteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoEighteenTriple() {
        x01Score.hit(on: .eightteen, with: .triple)
        x01Score.undo(on: .eightteen, with: .triple)

        XCTAssertEqual(x01Score.marks[.eightteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .eightteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoNineteenSingle() {
        x01Score.hit(on: .nineteen, with: .single)
        x01Score.undo(on: .nineteen, with: .single)
        
        XCTAssertEqual(x01Score.marks[.nineteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .nineteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoNineteenDouble() {
        x01Score.hit(on: .nineteen, with: .double)
        x01Score.undo(on: .nineteen, with: .double)

        XCTAssertEqual(x01Score.marks[.nineteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .nineteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoNineteenTriple() {
        x01Score.hit(on: .nineteen, with: .triple)
        x01Score.undo(on: .nineteen, with: .triple)

        XCTAssertEqual(x01Score.marks[.nineteen], 0)
        XCTAssertEqual(x01Score.marks.points(for: .nineteen), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoTwentySingle() {
        x01Score.hit(on: .twenty, with: .single)
        x01Score.undo(on: .twenty, with: .single)
        
        XCTAssertEqual(x01Score.marks[.twenty], 0)
        XCTAssertEqual(x01Score.marks.points(for: .twenty), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoTwentyDouble() {
        x01Score.hit(on: .twenty, with: .double)
        x01Score.undo(on: .twenty, with: .double)

        XCTAssertEqual(x01Score.marks[.twenty], 0)
        XCTAssertEqual(x01Score.marks.points(for: .twenty), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoTwentyTriple() {
        x01Score.hit(on: .twenty, with: .triple)
        x01Score.undo(on: .twenty, with: .triple)

        XCTAssertEqual(x01Score.marks[.twenty], 0)
        XCTAssertEqual(x01Score.marks.points(for: .twenty), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoBullSingle() {
        x01Score.hit(on: .bull, with: .single)
        x01Score.undo(on: .bull, with: .single)
        
        XCTAssertEqual(x01Score.marks[.bull], 0)
        XCTAssertEqual(x01Score.marks.points(for: .bull), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
    
    func testUndoBullDouble() {
        x01Score.hit(on: .bull, with: .double)
        x01Score.undo(on: .bull, with: .double)

        XCTAssertEqual(x01Score.marks[.bull], 0)
        XCTAssertEqual(x01Score.marks.points(for: .bull), 0)
        XCTAssertEqual(x01Score.points, 301)
    }
}
