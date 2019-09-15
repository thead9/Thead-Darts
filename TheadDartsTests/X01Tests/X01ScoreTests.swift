//
//  X01StartingPoint.swift
//  TheadDartsTests
//
//  Created by Thomas Headley on 9/15/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

import XCTest
@testable import TheadDarts

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
        
        XCTAssertEqual(x01Score.marks.one, 0)
        XCTAssertEqual(x01Score.marks.two, 0)
        XCTAssertEqual(x01Score.marks.three, 0)
        XCTAssertEqual(x01Score.marks.four, 0)
        XCTAssertEqual(x01Score.marks.five, 0)
        XCTAssertEqual(x01Score.marks.six, 0)
        XCTAssertEqual(x01Score.marks.seven, 0)
        XCTAssertEqual(x01Score.marks.eight, 0)
        XCTAssertEqual(x01Score.marks.nine, 0)
        XCTAssertEqual(x01Score.marks.ten, 0)
        XCTAssertEqual(x01Score.marks.eleven, 0)
        XCTAssertEqual(x01Score.marks.twelve, 0)
        XCTAssertEqual(x01Score.marks.thirteen, 0)
        XCTAssertEqual(x01Score.marks.fourteen, 0)
        XCTAssertEqual(x01Score.marks.fifteen, 0)
        XCTAssertEqual(x01Score.marks.sixteen, 0)
        XCTAssertEqual(x01Score.marks.seventeen, 0)
        XCTAssertEqual(x01Score.marks.eightteen, 0)
        XCTAssertEqual(x01Score.marks.nineteen, 0)
        XCTAssertEqual(x01Score.marks.twenty, 0)
        XCTAssertEqual(x01Score.marks.bull, 0)
        
        XCTAssertEqual(x01Score.onePoints, 0)
        XCTAssertEqual(x01Score.twoPoints, 0)
        XCTAssertEqual(x01Score.threePoints, 0)
        XCTAssertEqual(x01Score.fourPoints, 0)
        XCTAssertEqual(x01Score.fivePoints, 0)
        XCTAssertEqual(x01Score.sixPoints, 0)
        XCTAssertEqual(x01Score.sevenPoints, 0)
        XCTAssertEqual(x01Score.eighteenPoints, 0)
        XCTAssertEqual(x01Score.ninePoints, 0)
        XCTAssertEqual(x01Score.tenPoints, 0)
        XCTAssertEqual(x01Score.elevenPoints, 0)
        XCTAssertEqual(x01Score.twelvePoints, 0)
        XCTAssertEqual(x01Score.thirteenPoints, 0)
        XCTAssertEqual(x01Score.fourteenPoints, 0)
        XCTAssertEqual(x01Score.fifteenPoints, 0)
        XCTAssertEqual(x01Score.sixteenPoints, 0)
        XCTAssertEqual(x01Score.seventeenPoints, 0)
        XCTAssertEqual(x01Score.eighteenPoints, 0)
        XCTAssertEqual(x01Score.nineteenPoints, 0)
        XCTAssertEqual(x01Score.twentyPoints, 0)
        XCTAssertEqual(x01Score.bullPoints, 0)
        
        XCTAssertEqual(x01Score.startingPoint, 301)
        
        XCTAssertEqual(x01Score.points, 301)
    }
}
