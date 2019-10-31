//
//  X01PlayerTests.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/15/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

import XCTest
@testable import Darts

class X01PlayerTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDefaultInit() {
        let x01Player = X01Player()
        XCTAssertEqual(x01Player.name, "Player")
    }
    
    func testInitWithName() {
        let x01Player = X01Player(name: "Bob")
        XCTAssertEqual(x01Player.name, "Bob")
    }
}
