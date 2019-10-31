//
//  CricketGameTests.swift
//  TheadDarts
//
//  Created by Thomas Headley on 5/30/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import XCTest
@testable import Darts

class CricketPlayerTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDefaultInit() {
        let cricketPlayer = CricketPlayer()
        XCTAssertEqual(cricketPlayer.name, "Player")
    }
    
    func testInitWithName() {
        let cricketPlayer = CricketPlayer(name: "Bob")
        XCTAssertEqual(cricketPlayer.name, "Bob")
    }
}
