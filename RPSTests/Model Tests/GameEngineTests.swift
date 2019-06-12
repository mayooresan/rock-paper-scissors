//
//  RPSTests.swift
//  RPSTests
//
//  Created by Jeyakumaran Mayooresan on 6/8/19.
//  Copyright © 2019 Jeyakumaran Mayooresan. All rights reserved.
//

import XCTest
@testable import RPS

class GameEngineTests: XCTestCase {
    var gameEngine: GameEngine!
    var mockGameEngine: GameEngine!
    var anotherGameEngine: GameEngine!
    
    override func setUp() {
        gameEngine = GameEngine(scoreOne: 0, scoreTwo: 0, gameType: .BotVsBot)
        mockGameEngine = MockGameEngine(scoreOne: 0, scoreTwo: 0, gameType: .HumanVsBot)
        anotherGameEngine = GameEngine(scoreOne: 0, scoreTwo: 0, gameType: .HumanVsBot)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGameEngineObject() {
        XCTAssertEqual(0, gameEngine.playerOne.playerScore, "player one score is not set properly")
        XCTAssertEqual(0, gameEngine.playerTwo.playerScore, "player two score is not set properly")
        XCTAssertEqual(GameType.BotVsBot, gameEngine.gameType, "game type is not set properly")
    }
    
    func testIncreaseScore() {
        gameEngine.playerOneScored()
        XCTAssertEqual(1, gameEngine.playerOne.playerScore, "player one score is not increasing properly")
        gameEngine.playerOneScored()
        XCTAssertEqual(2, gameEngine.playerOne.playerScore, "player one score is not increasing properly")
        gameEngine.playerTwoScored()
        XCTAssertEqual(1, gameEngine.playerTwo.playerScore, "player one score is not increasing properly")
        gameEngine.playerTwoScored()
        gameEngine.playerTwoScored()
        XCTAssertEqual(3, gameEngine.playerTwo.playerScore, "player one score is not increasing properly")
    }
    
    func testHadAnyOneWon() {
        gameEngine.playerTwoScored()
        gameEngine.playerTwoScored()
        gameEngine.playerTwoScored()
        
        XCTAssertEqual(gameEngine.hasAnyOneWon(), Players.playerTwo, "winner not properly selected")
    }
    
    func testHadAnyOneWonPlayerOne() {
        gameEngine.playerOneScored()
        gameEngine.playerOneScored()
        gameEngine.playerOneScored()
        
        XCTAssertEqual(gameEngine.hasAnyOneWon(), Players.playerOne, "winner not properly selected")
    }
    
    func testHadAnyOneWonWithNil() {
        gameEngine.playerTwoScored()
        gameEngine.playerTwoScored()
        
        XCTAssertNil(gameEngine.hasAnyOneWon(), "nil not returned")
    }
    
    func testCheckWinnerDraw() {
        XCTAssertEqual(gameEngine.checkWinner(selectionOne: .Paper, selectionTwo: .Paper), GameVictoryState.Draw, "winner check isn't working as expected for paper")
        XCTAssertEqual(gameEngine.checkWinner(selectionOne: .Rock, selectionTwo: .Rock), GameVictoryState.Draw, "winner check isn't working as expected for rock")
        XCTAssertEqual(gameEngine.checkWinner(selectionOne: .Scissors, selectionTwo: .Scissors), GameVictoryState.Draw, "winner check isn't working as expected for scissors")
    }
    
    func testCheckWinnerRock() {
        XCTAssertEqual(gameEngine.checkWinner(selectionOne: .Rock, selectionTwo: .Scissors), GameVictoryState.Lose, "winner check isn't working as expected for rock")
        XCTAssertEqual(gameEngine.checkWinner(selectionOne: .Rock, selectionTwo: .Paper), GameVictoryState.Won, "winner check isn't working as expected for rock")
    }
    
    func testCheckWinnerPaper() {
        XCTAssertEqual(gameEngine.checkWinner(selectionOne: .Paper, selectionTwo: .Rock), GameVictoryState.Lose, "winner check isn't working as expected for paper")
        XCTAssertEqual(gameEngine.checkWinner(selectionOne: .Paper, selectionTwo: .Scissors), GameVictoryState.Won, "winner check isn't working as expected for paper")
    }
    
    func testCheckWinnerScissors() {
        XCTAssertEqual(gameEngine.checkWinner(selectionOne: .Scissors, selectionTwo: .Rock), GameVictoryState.Won, "winner check isn't working as expected for scissors")
        XCTAssertEqual(gameEngine.checkWinner(selectionOne: .Scissors, selectionTwo: .Paper), GameVictoryState.Lose, "winner check isn't working as expected for scissors")
    }
    
    func testCheckWinnerOther() {
        XCTAssertEqual(gameEngine.checkWinner(selectionOne: .Scissors, selectionTwo: .Other), GameVictoryState.Draw, "winner check isn't working as expected for scissors")
    }
    
    func testGameSelectionForNumber() {
        XCTAssertEqual(gameEngine.gameSelectionForNumber(value: 0), GameSelection.Rock, "game selector failed")
        XCTAssertEqual(gameEngine.gameSelectionForNumber(value: 1), GameSelection.Paper, "game selector failed")
        XCTAssertEqual(gameEngine.gameSelectionForNumber(value: 2), GameSelection.Scissors, "game selector failed")
    }
    
    func testWaitingTime() {
        XCTAssertEqual(anotherGameEngine.waitingTime, 5, "default waiting time failed")
    }
    
    func testNumberOfRouds() {
        XCTAssertEqual(gameEngine.numberOfRounds, 3, "default number of rounds failed")
    }
    
    func testRandomNumberGenMock() {
        XCTAssertEqual(mockGameEngine.randomSelection(), GameSelection.Rock, "game selection doesn't work properly")
    }
}
