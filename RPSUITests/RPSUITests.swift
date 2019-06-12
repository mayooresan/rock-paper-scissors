//
//  RPSUITests.swift
//  RPSUITests
//
//  Created by Jeyakumaran Mayooresan on 6/8/19.
//  Copyright © 2019 Jeyakumaran Mayooresan. All rights reserved.
//

import XCTest

class RPSUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBotVsBot() {
        let app = XCUIApplication()
        app.buttons["BOT Vs BOT"].tap()
        let changeModeButton = app.buttons["CHANGE MODE"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: changeModeButton, handler: nil)
        waitForExpectations(timeout: 30) { (error) in
            print(error?.localizedDescription ?? "")
        }
        changeModeButton.tap()
    }
    
    func testHumanVsBot_TimeOutLost() {
        
        let app = XCUIApplication()
        app.buttons["PLAYER Vs BOT"].tap()
        let changeModeButton = app.buttons["CHANGE MODE"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: changeModeButton, handler: nil)
        waitForExpectations(timeout: 30) { (error) in
            print(error?.localizedDescription ?? "")
        }
        changeModeButton.tap()
        
    }
    
    func testPlayAGaincheck_PlayerVsBot(){
        
        let app = XCUIApplication()
        app.buttons["PLAYER Vs BOT"].tap()
        
        let playAgainButton = app.buttons["PLAY AGAIN"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: playAgainButton, handler: nil)
        waitForExpectations(timeout: 30) { (error) in
            print(error?.localizedDescription ?? "")
        }
        playAgainButton.tap()
        
        
        let changeModeButton = app.buttons["CHANGE MODE"]
        expectation(for: exists, evaluatedWith: changeModeButton, handler: nil)
        waitForExpectations(timeout: 30) { (error) in
            print(error?.localizedDescription ?? "")
        }
        changeModeButton.tap()
    }
    
    func testPlayGameCheckbuttonTap() {
        
        let app = XCUIApplication()
        app.buttons["PLAYER Vs BOT"].tap()
        sleep(2)
        app.buttons["rockbtn"].tap()
        sleep(2)
        app.buttons["paperbtn"].tap()
        sleep(2)
        //press scissors button finally
        let scissorsBtn = app.buttons["scissorsbtn"]
        scissorsBtn.tap()
        
        //these labels can't be empty
        let labelElementOne = app.staticTexts["playerOneScoreId"]
        let labelElementTwo = app.staticTexts["playerTwoScoreId"]
        XCTAssertNotEqual(labelElementOne.label, "")
        XCTAssertNotEqual(labelElementTwo.label, "")
        
        //navigate back to home screen
        let changeModeButton = app.buttons["CHANGE MODE"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: changeModeButton, handler: nil)
        waitForExpectations(timeout: 30) { (error) in
            print(error?.localizedDescription ?? "")
        }
        changeModeButton.tap()
        
    }

}
