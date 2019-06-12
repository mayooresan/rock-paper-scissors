//
//  PlayerTests.swift
//  RPSTests
//
//  Created by Jeyakumaran Mayooresan on 6/11/19.
//  Copyright © 2019 Jeyakumaran Mayooresan. All rights reserved.
//

import XCTest
@testable import RPS

class PlayerTests: XCTestCase {
    var playerOne: Player!
    var playerTwo: Player!
    var playerThree: Player!
    
    override func setUp() {
        playerOne = Player(playerScore: 0, playerType: .playerOne)
        playerTwo = Player(playerScore: 0, playerType: .playerTwo)
        playerThree = Player(playerType: .playerOne)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlayerType() {
        XCTAssertEqual(playerOne.playerType, Players.playerOne)
        XCTAssertEqual(playerTwo.playerType, Players.playerTwo)
    }
    
    func testInitDefaultValueScore_Zero() {
        XCTAssertEqual(playerThree.playerScore, 0)
    }
    
    func testIncreaseScore() {
        playerOne.playerScore = playerOne.playerScore + 1
        XCTAssertEqual(playerOne.playerScore, 1)
    }
    
    func testAssigningMinusScore() {
        playerOne.playerScore = -1
        XCTAssertNotEqual(playerOne.playerScore, -1)
        //check whether it retains old value
        XCTAssertEqual(playerOne.playerScore, 0)
    }
    
    func testCheckAssiningLessScoreThanBefore() {
        playerOne.playerScore = 1
        playerOne.playerScore = 0
        
        XCTAssertNotEqual(playerOne.playerScore, 0)
        //check whether it retains old value
        XCTAssertEqual(playerOne.playerScore, 1)
    }

}
