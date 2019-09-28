//
//  X01GameTests.swift
//  TheadDartsTests
//
//  Created by Thomas Headley on 9/28/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import XCTest
@testable import TheadDarts

class X01GameTests: XCTestCase {
    
    var x01Game = X01Game(numberOfPlayers: 2)
    var x01Score1 = X01Score()
    var x01Score2 = X01Score()
    var x01Player1 = X01Player(name: "PlayerOne")
    var x01Player2 = X01Player(name: "PlayerTwo")
    
    override func setUp() {
        x01Game = X01Game(numberOfPlayers: 2)
        x01Score1 = x01Game.playerUnits[0].score
        x01Score2 = x01Game.playerUnits[1].score
        x01Player1 = X01Player(name: "PlayerOne")
        x01Player2 = X01Player(name: "PlayerTwo")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Inits
    func testInitWithNumberOfPlayers() {
        XCTAssertEqual(x01Game.players[0].name, "Player 1")
        XCTAssertEqual(x01Game.players[1].name, "Player 2")
    }
    
    func testInitWithPreDefinedPlayers() {
        let x01Game = X01Game(players: [x01Player1, x01Player2])
        XCTAssertEqual(x01Game.players[0].name, "PlayerOne")
        XCTAssertEqual(x01Game.players[1].name, "PlayerTwo")
    }
    
    // MARK: Adding Players
    func testAddingPlayerWithDefaultName() {
        x01Game.addPlayer()
        XCTAssertEqual(x01Game.players[2].name, "Player 3")
    }
    
    func testAddingPlayerWithCustomName() {
        x01Game.addPlayer(named: "PlayerThree")
        XCTAssertEqual(x01Game.players[2].name, "PlayerThree")
    }
    
    func testAddingPreExistingPlayer() {
        let preExistingPlayer = X01Player(name: "Bob")
        x01Game.addPlayer(preExistingPlayer)
        XCTAssertEqual(x01Game.players[2].name, "Bob")
    }
    
    // MARK: Removing Players
    func testRemovingDefaultLastPlayer() {
        let removedPlayer = x01Game.removePlayer()
        XCTAssertEqual(x01Game.players.count, 1)
        XCTAssertEqual(x01Game.players[0].name, "Player 1")
        XCTAssertEqual(removedPlayer.name, "Player 2")
    }
    
    func testRemovingPlayerAtIndex() {
        let removedPlayer = x01Game.removePlayer(at: 0)
        XCTAssertEqual(x01Game.players.count, 1)
        XCTAssertEqual(x01Game.players[0].name, "Player 2")
        XCTAssertEqual(removedPlayer!.name, "Player 1")
    }
    
    func testRemovingPlayerAtIndexOutOfBounds() {
        let removedPlayer = x01Game.removePlayer(at: 2)
        XCTAssertEqual(x01Game.players.count, 2)
        XCTAssertNil(removedPlayer)
    }
    
    func testRemovingPlayerAtNegativeIndex() {
        let removedPlayer = x01Game.removePlayer(at: -1)
        XCTAssertEqual(x01Game.players.count, 2)
        XCTAssertNil(removedPlayer)
    }
    
    // MARK: Adding and Removing Players
    func testAddingThenRemovingPlayer() {
        x01Game.addPlayer()
        XCTAssertEqual(x01Game.players.count, 3)
        x01Game.removePlayer()
        XCTAssertEqual(x01Game.players.count, 2)
    }
    
    func testRemovingThenAddingPlayer() {
        x01Game.removePlayer()
        XCTAssertEqual(x01Game.players.count, 1)
        x01Game.addPlayer()
        XCTAssertEqual(x01Game.players.count, 2)
        XCTAssertEqual(x01Game.players[1].name, "Player 2")
    }
    
    func testAddingPlayerWithDefaultNumberGreaterThanPlayerCount() {
        x01Game.addPlayer()
        x01Game.addPlayer()
        XCTAssertEqual(x01Game.players.count, 4)
        x01Game.removePlayer(at: 2)
        x01Game.addPlayer()
        XCTAssertEqual(x01Game.players.count, 4)
        XCTAssertEqual(x01Game.players.last!.name, "Player 5")
    }
    
    // MARK: Modifying Players
    func testChangePlayerName() {
        let changedPlayer = x01Game.changePlayerName(at: 0, to: "Bob")
        XCTAssertEqual(x01Game.players[0].name, "Bob")
        XCTAssertEqual(changedPlayer?.name, "Bob")
    }
    
    func testChangingPlayerNameAtIndexOutOfBounds() {
        let changedPlayer = x01Game.changePlayerName(at: 2, to: "Bob")
        XCTAssertNil(changedPlayer)
    }
    
    func testChangingPlayerNameAtNegativeIndex() {
        let changedPlayer = x01Game.changePlayerName(at: -1, to: "Bob")
        XCTAssertNil(changedPlayer)
    }
    
    func testChangingLastPlayerNameThenAddingPlayer() {
        x01Game.changePlayerName(at: 1, to: "Bob")
        x01Game.addPlayer()
        XCTAssertEqual(x01Game.players[2].name, "Player 3")
    }
    
    // MARK: Gameplay
    func testHit() {
        x01Score1.hit(on: .one, with: .single)
        XCTAssertEqual(x01Game.scores[0].points, 300)
    }
    
    func testTryingToThrowFourDarts() {
        x01Score1.hit(on: .one, with: .single)
        x01Score1.hit(on: .one, with: .single)
        x01Score1.hit(on: .one, with: .single)
        x01Score1.hit(on: .one, with: .single)

        XCTAssertEqual(x01Game.scores[0].points, 298)
    }
    
    func testNoWinner() {
        XCTAssertNil(x01Game.winnerIndex)
        XCTAssertNil(x01Game.winner)
        XCTAssertFalse(x01Game.gameOver)
    }
    
    func testWinner() {
        x01Score1.startingPoint = 10
        x01Score1.hit(on: .five, with: .double)
        
        XCTAssertEqual(x01Game.winnerIndex, 0)
        XCTAssertNotNil(x01Game.winner)
        XCTAssertTrue(x01Game.gameOver)
    }
    
//    func testBustNegativeScore() {
//        x01Score1.startingPoint = 10
//        x01Score1.hit(on: .eleven, with: .single)
//
//
//    }
}
