//
//  ResultControllerTests.swift
//  RPSTests
//
//  Created by Jeyakumaran Mayooresan on 6/10/19.
//  Copyright © 2019 Jeyakumaran Mayooresan. All rights reserved.
//

import XCTest
@testable import RPS

class ResultControllerTests: XCTestCase {
    var resultController: ResultController!
    
    override func setUp() {
        resultController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultControllerId") as? ResultController
        resultController.gameEngine = GameEngine(scoreOne: 0, scoreTwo: 0, gameType: .HumanVsBot)
        resultController.gameEngine?.resultString = "YOU WON"
        _ = resultController.view
       

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNil_GameEngine() {
        XCTAssertNotNil(resultController.gameEngine)
        resultController.gameEngine?.resultString = "YOU WON"
        XCTAssertEqual(resultController.gameEngine?.resultString, "YOU WON")
    }
    
    func testNil_UIComponents() {
        XCTAssertNotNil(resultController.bannerImageView)
        XCTAssertNotNil(resultController.resultLabel)
    }
    
    func testImageView_Result() {
        let label = resultController.resultLabel
        XCTAssertEqual(label?.text, "YOU WON")
    }

}
