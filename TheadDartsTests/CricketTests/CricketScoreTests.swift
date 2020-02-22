//
//  CricketScoreTests.swift
//  TheadDarts
//
//  Created by Thomas Headley on 6/9/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import XCTest
@testable import Darts

class CricketScoreTests: XCTestCase {
    
    var cricketScore = CricketScore()
    
    override func setUp() {
        cricketScore = CricketScore()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Inits
    func testDefaultInit() {
        cricketScore = CricketScore()
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    // MARK: Hits
    func testHitOne() {
        cricketScore.hit(on: .one, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitTwo() {
        cricketScore.hit(on: .two, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitThree() {
        cricketScore.hit(on: .three, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitFour() {
        cricketScore.hit(on: .four, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitFive() {
        cricketScore.hit(on: .five, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitSix() {
        cricketScore.hit(on: .six, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitSeven() {
        cricketScore.hit(on: .seven, with: .single)
        
         XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitEight() {
        cricketScore.hit(on: .eight, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitNine() {
        cricketScore.hit(on: .nine, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitTen() {
        cricketScore.hit(on: .ten, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitEleven() {
        cricketScore.hit(on: .eleven, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitTwelve() {
        cricketScore.hit(on: .twelve, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitThirteen() {
        cricketScore.hit(on: .thirteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitFourteen() {
        cricketScore.hit(on: .fourteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitFifteen() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .fifteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 4)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 15)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHitFifteenDouble() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .fifteen, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 5)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 30)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHitFifteenTriple() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .fifteen, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 6)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 45)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitSixteen() {
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 4)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 16)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHitSixteenDouble() {
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 5)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 32)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHitSixteenTriple() {
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 6)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 48)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitSeventeen() {
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 4)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 17)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHitSeventeenDouble() {
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 5)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 34)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHitSeventeenTriple() {
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 6)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 51)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHiteightteen() {
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 4)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 18)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHiteightteenDouble() {
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 5)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 36)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHiteightteenTriple() {
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 6)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 54)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitNineteen() {
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 4)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 19)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHitNineteenDouble() {
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 5)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 38)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHitNineteenTriple() {
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 6)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 57)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitTwenty() {
        cricketScore.hit(on: .twenty, with: .triple)
        cricketScore.hit(on: .twenty, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 4)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 20)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHitTwentyDouble() {
        cricketScore.hit(on: .twenty, with: .triple)
        cricketScore.hit(on: .twenty, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 5)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 40)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHitTwentyTriple() {
        cricketScore.hit(on: .twenty, with: .triple)
        cricketScore.hit(on: .twenty, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 6)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 60)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testHitBull() {
        cricketScore.hit(on: .bull, with: .double)
        cricketScore.hit(on: .bull, with: .single)
        cricketScore.hit(on: .bull, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 4)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 25)
    }
    func testHitBullNotRequired() {
        cricketScore.bullRequired = false
        
        cricketScore.hit(on: .bull, with: .double)
        cricketScore.hit(on: .bull, with: .single)
        cricketScore.hit(on: .bull, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHitBullDouble() {
        cricketScore.hit(on: .bull, with: .double)
        cricketScore.hit(on: .bull, with: .single)
        cricketScore.hit(on: .bull, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 5)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 50)
    }
    func testHitBullDoubleNotRequired() {
        cricketScore.bullRequired = false

        cricketScore.hit(on: .bull, with: .double)
        cricketScore.hit(on: .bull, with: .single)
        cricketScore.hit(on: .bull, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHitBullTriple() {
        cricketScore.hit(on: .bull, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testHitBullTripleNotRequired() {
        cricketScore.bullRequired = false

        cricketScore.hit(on: .bull, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    // MARK: Undo
    func testUndoOne() {
        cricketScore.hit(on: .one, with: .single)
        cricketScore.undo(on: .one, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoTwo() {
        cricketScore.hit(on: .two, with: .single)
        cricketScore.undo(on: .two, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoThree() {
        cricketScore.hit(on: .three, with: .single)
        cricketScore.undo(on: .three, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoFour() {
        cricketScore.hit(on: .four, with: .single)
        cricketScore.undo(on: .four, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoFive() {
        cricketScore.hit(on: .five, with: .single)
        cricketScore.undo(on: .five, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoSix() {
        cricketScore.hit(on: .six, with: .single)
        cricketScore.undo(on: .six, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoSeven() {
        cricketScore.hit(on: .seven, with: .single)
        cricketScore.undo(on: .seven, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoEight() {
        cricketScore.hit(on: .eight, with: .single)
        cricketScore.undo(on: .eight, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoNine() {
        cricketScore.hit(on: .nine, with: .single)
        cricketScore.undo(on: .nine, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoTen() {
        cricketScore.hit(on: .ten, with: .single)
        cricketScore.undo(on: .ten, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoEleven() {
        cricketScore.hit(on: .eleven, with: .single)
        cricketScore.undo(on: .eleven, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoTwelve() {
        cricketScore.hit(on: .twelve, with: .single)
        cricketScore.undo(on: .twelve, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoThirteen() {
        cricketScore.hit(on: .thirteen, with: .single)
        cricketScore.undo(on: .thirteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoFourteen() {
        cricketScore.hit(on: .fourteen, with: .single)
        cricketScore.undo(on: .fourteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoFifteen() {
        cricketScore.hit(on: .fifteen, with: .single)
        cricketScore.undo(on: .fifteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoFifteenDouble() {
        cricketScore.hit(on: .fifteen, with: .double)
        cricketScore.undo(on: .fifteen, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoFifteenTriple() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.undo(on: .fifteen, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoFifteenToNegative() {
        cricketScore.undo(on: .fifteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoSixteen() {
        cricketScore.hit(on: .sixteen, with: .single)
        cricketScore.undo(on: .sixteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoSixteenDouble() {
        cricketScore.hit(on: .sixteen, with: .double)
        cricketScore.undo(on: .sixteen, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoSixteenTriple() {
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.undo(on: .sixteen, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoSixteenToNegative() {
        cricketScore.undo(on: .sixteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoSeventeen() {
        cricketScore.hit(on: .seventeen, with: .single)
        cricketScore.undo(on: .seventeen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoSeventeenDouble() {
        cricketScore.hit(on: .seventeen, with: .double)
        cricketScore.undo(on: .seventeen, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoSeventeenTriple() {
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.undo(on: .seventeen, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoSeventeenToNegative() {
        cricketScore.undo(on: .seventeen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoeightteen() {
        cricketScore.hit(on: .eightteen, with: .single)
        cricketScore.undo(on: .eightteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoeightteenDouble() {
        cricketScore.hit(on: .eightteen, with: .double)
        cricketScore.undo(on: .eightteen, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoeightteenTriple() {
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.undo(on: .eightteen, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoeightteenToNegative() {
        cricketScore.undo(on: .eightteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoNineteen() {
        cricketScore.hit(on: .nineteen, with: .single)
        cricketScore.undo(on: .nineteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoNineteenDouble() {
        cricketScore.hit(on: .nineteen, with: .double)
        cricketScore.undo(on: .nineteen, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testundoNineteenTriple() {
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.undo(on: .nineteen, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoNineteenToNegative() {
        cricketScore.undo(on: .nineteen, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoTwenty() {
        cricketScore.hit(on: .twenty, with: .single)
        cricketScore.undo(on: .twenty, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoTwentyDouble() {
        cricketScore.hit(on: .twenty, with: .double)
        cricketScore.undo(on: .twenty, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoTwentyTriple() {
        cricketScore.hit(on: .twenty, with: .triple)
        cricketScore.undo(on: .twenty, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoTwentyToNegative() {
        cricketScore.undo(on: .twenty, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    func testUndoBull() {
        cricketScore.hit(on: .bull, with: .single)
        cricketScore.undo(on: .bull, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoBullDouble() {
        cricketScore.hit(on: .bull, with: .double)
        cricketScore.undo(on: .bull, with: .double)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoBullTriple() {
        cricketScore.hit(on: .bull, with: .triple)
        cricketScore.undo(on: .bull, with: .triple)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    func testUndoBullToNegative() {
        cricketScore.undo(on: .bull, with: .single)
        
        XCTAssertEqual(cricketScore.marks[.fifteen], 0)
        XCTAssertEqual(cricketScore.marks[.sixteen], 0)
        XCTAssertEqual(cricketScore.marks[.seventeen], 0)
        XCTAssertEqual(cricketScore.marks[.eightteen], 0)
        XCTAssertEqual(cricketScore.marks[.nineteen], 0)
        XCTAssertEqual(cricketScore.marks[.twenty], 0)
        XCTAssertEqual(cricketScore.marks[.bull], 0)
        
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .fifteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .sixteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .seventeen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .eightteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .nineteen), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .twenty), 0)
        XCTAssertEqual(cricketScore.marks.cricketPoints(for: .bull), 0)
    }
    
    // MARK: All Closed
    func testAllClosed() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .twenty, with: .triple)
        cricketScore.hit(on: .bull, with: .double)
        cricketScore.hit(on: .bull, with: .single)
        
        XCTAssertTrue(cricketScore.allClosed)
    }
    func testAllClosedBullNotRequired() {
        cricketScore.bullRequired = false
        
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .twenty, with: .triple)
        
        XCTAssertTrue(cricketScore.allClosed)
    }
    
    func testNotAllClosedBecauseOfFifteen() {
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .twenty, with: .triple)
        cricketScore.hit(on: .bull, with: .triple)
        
        XCTAssertFalse(cricketScore.allClosed)
    }
    
    func testNotAllClosedBecauseOfSixteen() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .twenty, with: .triple)
        cricketScore.hit(on: .bull, with: .triple)
        
        XCTAssertFalse(cricketScore.allClosed)
    }
    
    func testNotAllClosedBecauseOfSeventeen() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .twenty, with: .triple)
        cricketScore.hit(on: .bull, with: .triple)
        
        XCTAssertFalse(cricketScore.allClosed)
    }
    
    func testNotAllClosedBecauseOfeightteen() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .twenty, with: .triple)
        cricketScore.hit(on: .bull, with: .triple)
        
        XCTAssertFalse(cricketScore.allClosed)
    }
    
    func testNotAllClosedBecauseOfNineteen() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .twenty, with: .triple)
        cricketScore.hit(on: .bull, with: .triple)
        
        XCTAssertFalse(cricketScore.allClosed)
    }
    
    func testNotAllClosedBecauseOfTwenty() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .bull, with: .triple)
        
        XCTAssertFalse(cricketScore.allClosed)
    }
    
    func testNotAllClosedBecauseOfBull() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .twenty, with: .triple)
        
        XCTAssertFalse(cricketScore.allClosed)
    }
    
    // MARK: Wedge Closed
    func testFifteenClosed() {
        cricketScore.hit(on: .fifteen, with: .triple)
        XCTAssertTrue(cricketScore.isWedgeClosed(.fifteen))
    }
    func testFifteenNotClosed() {
        XCTAssertFalse(cricketScore.isWedgeClosed(.fifteen))
    }
    
    func testSixteenClosed() {
        cricketScore.hit(on: .sixteen, with: .triple)
        XCTAssertTrue(cricketScore.isWedgeClosed(.sixteen))
    }
    func testSixteenNotClosed() {
        XCTAssertFalse(cricketScore.isWedgeClosed(.sixteen))
    }
    
    func testSeventeenClosed() {
        cricketScore.hit(on: .seventeen, with: .triple)
        XCTAssertTrue(cricketScore.isWedgeClosed(.seventeen))
    }
    func testSeventeenNotClosed() {
        XCTAssertFalse(cricketScore.isWedgeClosed(.seventeen))
    }
    
    func testeightteenClosed() {
        cricketScore.hit(on: .eightteen, with: .triple)
        XCTAssertTrue(cricketScore.isWedgeClosed(.eightteen))
    }
    func testeightteenNotClosed() {
        XCTAssertFalse(cricketScore.isWedgeClosed(.eightteen))
    }
    
    func testNineteenClosed() {
        cricketScore.hit(on: .nineteen, with: .triple)
        XCTAssertTrue(cricketScore.isWedgeClosed(.nineteen))
    }
    func testNineteenNotClosed() {
        XCTAssertFalse(cricketScore.isWedgeClosed(.nineteen))
    }
    
    func testTwentyClosed() {
        cricketScore.hit(on: .twenty, with: .triple)
        XCTAssertTrue(cricketScore.isWedgeClosed(.twenty))
    }
    func testTwentyNotClosed() {
        XCTAssertFalse(cricketScore.isWedgeClosed(.twenty))
    }
    
    func testBullClosed() {
        cricketScore.hit(on: .bull, with: .double)
        cricketScore.hit(on: .bull, with: .single)
        XCTAssertTrue(cricketScore.isWedgeClosed(.bull))
    }
    func testBullNotClosed() {
        XCTAssertFalse(cricketScore.isWedgeClosed(.bull))
    }
    
    // MARK: Points
    func testSingleHits() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .twenty, with: .triple)
        cricketScore.hit(on: .bull, with: .double)
        cricketScore.hit(on: .bull, with: .single)
        
        cricketScore.hit(on: .fifteen, with: .single)
        cricketScore.hit(on: .sixteen, with: .single)
        cricketScore.hit(on: .seventeen, with: .single)
        cricketScore.hit(on: .eightteen, with: .single)
        cricketScore.hit(on: .nineteen, with: .single)
        cricketScore.hit(on: .twenty, with: .single)
        cricketScore.hit(on: .bull, with: .single)
        XCTAssertEqual(cricketScore.points, 130)
    }
    
    func testDoubleHits() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .twenty, with: .triple)
        cricketScore.hit(on: .bull, with: .double)
        cricketScore.hit(on: .bull, with: .single)
        
        cricketScore.hit(on: .fifteen, with: .double)
        cricketScore.hit(on: .sixteen, with: .double)
        cricketScore.hit(on: .seventeen, with: .double)
        cricketScore.hit(on: .eightteen, with: .double)
        cricketScore.hit(on: .nineteen, with: .double)
        cricketScore.hit(on: .twenty, with: .double)
        cricketScore.hit(on: .bull, with: .double)
        XCTAssertEqual(cricketScore.points, 260)
    }
    
    func testTripleHits() {
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .twenty, with: .triple)
        cricketScore.hit(on: .bull, with: .double)
        cricketScore.hit(on: .bull, with: .single)
        
        cricketScore.hit(on: .fifteen, with: .triple)
        cricketScore.hit(on: .sixteen, with: .triple)
        cricketScore.hit(on: .seventeen, with: .triple)
        cricketScore.hit(on: .eightteen, with: .triple)
        cricketScore.hit(on: .nineteen, with: .triple)
        cricketScore.hit(on: .twenty, with: .triple)
        XCTAssertEqual(cricketScore.points, 315)
    }
}
