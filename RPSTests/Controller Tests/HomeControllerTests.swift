//
//  HomeControllerTests.swift
//  RPSTests
//
//  Created by Jeyakumaran Mayooresan on 6/10/19.
//  Copyright © 2019 Jeyakumaran Mayooresan. All rights reserved.
//

import XCTest
@testable import RPS

class HomeControllerTests: XCTestCase {
    var homeController: HomeController!
    
    override func setUp() {
        homeController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeControllerId") as? HomeController
        _ = homeController.view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCheckNil_GameEngine() {
        XCTAssertNotNil(homeController.gameEngine)
    }
}
