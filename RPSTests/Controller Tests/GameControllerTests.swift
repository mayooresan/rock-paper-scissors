//
//  GameControllerTests.swift
//  RPSTests
//
//  Created by Jeyakumaran Mayooresan on 6/10/19.
//  Copyright © 2019 Jeyakumaran Mayooresan. All rights reserved.
//

import XCTest
@testable import RPS

class GameControllerTests: XCTestCase {

    var gameController: GameController!
    
    override func setUp() {
        gameController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameControllerId") as? GameController
        _ = gameController.view
        gameController.gameEngine = GameEngine(scoreOne: 0, scoreTwo: 0, gameType: .HumanVsBot)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCheckGameEngine_initialValues() {
        XCTAssertEqual(gameController.gameEngine?.numberOfRounds, 3)
        XCTAssertEqual(gameController.gameEngine?.playerOne.playerScore, 0)
        XCTAssertEqual(gameController.gameEngine?.playerTwo.playerScore, 0)
        XCTAssertEqual(gameController.gameEngine?.gameType, GameType.HumanVsBot)
    }

    func testCheckNil_UIComponents() {
        XCTAssertNotNil(gameController.timerView)
        XCTAssertNotNil(gameController.timerLabel)
        XCTAssertNotNil(gameController.playerOneScoreLabel)
        XCTAssertNotNil(gameController.playerTwoScoreLabel)
        XCTAssertNotNil(gameController.playerOneSelectionImageView)
        XCTAssertNotNil(gameController.playerTwoSelectionImageView)
        XCTAssertNotNil(gameController.rockButton)
        XCTAssertNotNil(gameController.paperButton)
        XCTAssertNotNil(gameController.scissorButton)
        XCTAssertNotNil(gameController.updatesLabel)
    }
}
