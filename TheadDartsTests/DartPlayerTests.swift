//
//  DartPlayerTests.swift
//  TheadDartsTests
//
//  Created by Thomas Headley on 11/15/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

import XCTest
@testable import Darts

class DartPlayerTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDefaultInit() {
        let x01Player = DartPlayer()
        XCTAssertEqual(x01Player.name, "Player")
    }
    
    func testInitWithName() {
        let x01Player = DartPlayer(name: "Bob")
        XCTAssertEqual(x01Player.name, "Bob")
    }
}
