//
//  CricketGameTests.swift
//  TheadDarts
//
//  Created by Thomas Headley on 5/30/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import XCTest
@testable import Darts

class CricketGameTests: XCTestCase {
    
    var cricketGame = CricketGame(numberOfPlayers: 2)
    var cricketScore1 = CricketScore()
    var cricketScore2 = CricketScore()
    var cricketPlayer1 = DartPlayer(name: "PlayerOne")
    var cricketPlayer2 = DartPlayer(name: "PlayerTwo")
    
    override func setUp() {
        cricketGame = CricketGame(numberOfPlayers: 2)
        cricketScore1 = cricketGame.playerUnits[0].score
        cricketScore2 = cricketGame.playerUnits[1].score
        cricketPlayer1 = DartPlayer(name: "PlayerOne")
        cricketPlayer2 = DartPlayer(name: "PlayerTwo")
    }
    
    func setUpBullNotRequired() {
        cricketGame = CricketGame(numberOfPlayers: 2, bullRequired: false)
        cricketScore1 = cricketGame.playerUnits[0].score
        cricketScore2 = cricketGame.playerUnits[1].score
        cricketPlayer1 = DartPlayer(name: "PlayerOne")
        cricketPlayer2 = DartPlayer(name: "PlayerTwo")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Inits
    func testInitWithNumberOfPlayers() {
        XCTAssertEqual(cricketGame.players[0].name, "Player 1")
        XCTAssertEqual(cricketGame.players[1].name, "Player 2")
    }
    
    func testInitWithPreDefinedPlayers() {
        let cricketGame = CricketGame(players: [cricketPlayer1, cricketPlayer2])
        XCTAssertEqual(cricketGame.players[0].name, "PlayerOne")
        XCTAssertEqual(cricketGame.players[1].name, "PlayerTwo")
    }
    
    // MARK: Adding Players
    func testAddingPlayerWithDefaultName() {
        cricketGame.addPlayer()
        XCTAssertEqual(cricketGame.players[2].name, "Player 3")
    }
    
    func testAddingPlayerWithCustomName() {
        cricketGame.addPlayer(named: "PlayerThree")
        XCTAssertEqual(cricketGame.players[2].name, "PlayerThree")
    }
    
    func testAddingPreExistingPlayer() {
        let preExistingPlayer = DartPlayer(name: "Bob")
        cricketGame.addPlayer(preExistingPlayer)
        XCTAssertEqual(cricketGame.players[2].name, "Bob")
    }
    
    // MARK: Removing Players
    func testRemovingDefaultLastPlayer() {
        let removedPlayer = cricketGame.removePlayer()
        XCTAssertEqual(cricketGame.players.count, 1)
        XCTAssertEqual(cricketGame.players[0].name, "Player 1")
        XCTAssertEqual(removedPlayer.name, "Player 2")
    }
    
    func testRemovingPlayerAtIndex() {
        let removedPlayer = cricketGame.removePlayer(at: 0)
        XCTAssertEqual(cricketGame.players.count, 1)
        XCTAssertEqual(cricketGame.players[0].name, "Player 2")
        XCTAssertEqual(removedPlayer!.name, "Player 1")
    }
    
    func testRemovingPlayerAtIndexOutOfBounds() {
        let removedPlayer = cricketGame.removePlayer(at: 2)
        XCTAssertEqual(cricketGame.players.count, 2)
        XCTAssertNil(removedPlayer)
    }
    
    func testRemovingPlayerAtNegativeIndex() {
        let removedPlayer = cricketGame.removePlayer(at: -1)
        XCTAssertEqual(cricketGame.players.count, 2)
        XCTAssertNil(removedPlayer)
    }
    
    // MARK: Adding and Removing Players
    func testAddingThenRemovingPlayer() {
        cricketGame.addPlayer()
        XCTAssertEqual(cricketGame.players.count, 3)
        cricketGame.removePlayer()
        XCTAssertEqual(cricketGame.players.count, 2)
    }
    
    func testRemovingThenAddingPlayer() {
        cricketGame.removePlayer()
        XCTAssertEqual(cricketGame.players.count, 1)
        cricketGame.addPlayer()
        XCTAssertEqual(cricketGame.players.count, 2)
        XCTAssertEqual(cricketGame.players[1].name, "Player 2")
    }
    
    func testAddingPlayerWithDefaultNumberGreaterThanPlayerCount() {
        cricketGame.addPlayer()
        cricketGame.addPlayer()
        XCTAssertEqual(cricketGame.players.count, 4)
        cricketGame.removePlayer(at: 2)
        cricketGame.addPlayer()
        XCTAssertEqual(cricketGame.players.count, 4)
        XCTAssertEqual(cricketGame.players.last!.name, "Player 5")
    }
    
    // MARK: Modifying Players
    func testChangePlayerName() {
        let changedPlayer = cricketGame.changePlayerName(at: 0, to: "Bob")
        XCTAssertEqual(cricketGame.players[0].name, "Bob")
        XCTAssertEqual(changedPlayer?.name, "Bob")
    }
    
    func testChangingPlayerNameAtIndexOutOfBounds() {
        let changedPlayer = cricketGame.changePlayerName(at: 2, to: "Bob")
        XCTAssertNil(changedPlayer)
    }
    
    func testChangingPlayerNameAtNegativeIndex() {
        let changedPlayer = cricketGame.changePlayerName(at: -1, to: "Bob")
        XCTAssertNil(changedPlayer)
    }
    
    func testChangingLastPlayerNameThenAddingPlayer() {
        cricketGame.changePlayerName(at: 1, to: "Bob")
        cricketGame.addPlayer()
        XCTAssertEqual(cricketGame.players[2].name, "Player 3")
    }
    
    // MARK: Hitting
    func testHittingWithNoOneClosed() {
        cricketScore1.hit(on: .fifteen, with: .single)
        XCTAssertEqual(cricketGame.scores[0].marks[.fifteen], 1)
    }
    
    func testHittingByOneClosed() {
        cricketScore1.hit(on: .fifteen, with: .triple)
        cricketScore1.hit(on: .fifteen, with: .single)

        XCTAssertEqual(cricketGame.scores[0].marks[.fifteen], 4)
    }
    
    func testHittingByOneNotClosedWithOneClosed() {
        cricketScore1.hit(on: .fifteen, with: .triple)
        cricketScore2.hit(on: .fifteen, with: .single)

        XCTAssertEqual(cricketGame.scores[0].marks[.fifteen], 3)
        XCTAssertEqual(cricketGame.scores[1].marks[.fifteen], 1)
    }
    
    func testHittingWithAllClosed() {
        cricketScore1.hit(on: .fifteen, with: .triple)
        cricketScore2.hit(on: .fifteen, with: .triple)
        cricketScore1.hit(on: .fifteen, with: .triple)
        cricketScore2.hit(on: .fifteen, with: .triple)

        XCTAssertEqual(cricketGame.scores[0].marks[.fifteen], 3)
        XCTAssertEqual(cricketGame.scores[0].marks[.fifteen], 3)
    }
    
    func testOverHitWhenOtherClosed() {
        cricketScore1.hit(on: .fifteen, with: .triple)
        cricketScore2.hit(on: .fifteen, with: .single)
        cricketScore2.hit(on: .fifteen, with: .triple)
        
        XCTAssertEqual(cricketGame.scores[0].marks[.fifteen], 3)
        XCTAssertEqual(cricketGame.scores[0].marks[.fifteen], 3)
    }
    
    // MARK: Winner & Game Over
    func testNoWinner() {
        XCTAssertNil(cricketGame.winnerIndex)
        XCTAssertNil(cricketGame.winner)
        XCTAssertFalse(cricketGame.gameOver)
    }
    
    func testWinnerIndexWithOnePlayerClosed() {
        cricketScore1.hit(on: .fifteen, with: .triple)
        cricketScore1.hit(on: .sixteen, with: .triple)
        cricketScore1.hit(on: .seventeen, with: .triple)
        cricketScore1.hit(on: .eightteen, with: .triple)
        cricketScore1.hit(on: .nineteen, with: .triple)
        cricketScore1.hit(on: .twenty, with: .triple)
        cricketScore1.hit(on: .bull, with: .double)
        cricketScore1.hit(on: .bull, with: .single)

        XCTAssertEqual(cricketGame.winnerIndex, 0)
        XCTAssertNotNil(cricketGame.winner)
        XCTAssertTrue(cricketGame.gameOver)
    }
    
    func testWinnerIndexWithOnePlayerClosedBullNotRequired() {
        setUpBullNotRequired()
        
        cricketScore1.hit(on: .fifteen, with: .triple)
        cricketScore1.hit(on: .sixteen, with: .triple)
        cricketScore1.hit(on: .seventeen, with: .triple)
        cricketScore1.hit(on: .eightteen, with: .triple)
        cricketScore1.hit(on: .nineteen, with: .triple)
        cricketScore1.hit(on: .twenty, with: .triple)
        
        XCTAssertEqual(cricketGame.winnerIndex, 0)
        XCTAssertNotNil(cricketGame.winner)
        XCTAssertTrue(cricketGame.gameOver)
    }
    
    func testNoWinnerWithOnePlayerClosed() {
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)

        cricketScore1.hit(on: .fifteen, with: .triple)
        cricketScore1.hit(on: .sixteen, with: .triple)
        cricketScore1.hit(on: .seventeen, with: .triple)
        cricketScore1.hit(on: .eightteen, with: .triple)
        cricketScore1.hit(on: .nineteen, with: .triple)
        cricketScore1.hit(on: .twenty, with: .triple)
        cricketScore1.hit(on: .bull, with: .double)
        cricketScore1.hit(on: .bull, with: .single)

        XCTAssertNil(cricketGame.winnerIndex)
        XCTAssertNil(cricketGame.winner)
        XCTAssertFalse(cricketGame.gameOver)
    }
    
    func testWinnerOvercomingPointDeficit() {
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        cricketScore2.hit(on: .twenty, with: .triple)
        
        cricketScore1.hit(on: .fifteen, with: .triple)
        cricketScore1.hit(on: .sixteen, with: .triple)
        cricketScore1.hit(on: .seventeen, with: .triple)
        cricketScore1.hit(on: .eightteen, with: .triple)
        cricketScore1.hit(on: .nineteen, with: .triple)
        cricketScore1.hit(on: .twenty, with: .triple)
        cricketScore1.hit(on: .bull, with: .double)
        cricketScore1.hit(on: .bull, with: .single)
        cricketScore1.hit(on: .nineteen, with: .triple)
        cricketScore1.hit(on: .nineteen, with: .triple)
        cricketScore1.hit(on: .nineteen, with: .triple)
        cricketScore1.hit(on: .nineteen, with: .triple)
        cricketScore1.hit(on: .nineteen, with: .triple)
        cricketScore1.hit(on: .nineteen, with: .triple)
        cricketScore1.hit(on: .nineteen, with: .triple)
        cricketScore1.hit(on: .nineteen, with: .triple)
        cricketScore1.hit(on: .nineteen, with: .triple)
        cricketScore1.hit(on: .nineteen, with: .triple)

        XCTAssertEqual(cricketGame.winnerIndex, 0)
        XCTAssertNotNil(cricketGame.winner)
        XCTAssertTrue(cricketGame.gameOver)
    }
    
}
