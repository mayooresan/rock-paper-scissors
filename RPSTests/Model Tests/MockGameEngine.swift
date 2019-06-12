//
//  MockGameEngine.swift
//  RPSTests
//
//  Created by Jeyakumaran Mayooresan on 6/9/19.
//  Copyright © 2019 Jeyakumaran Mayooresan. All rights reserved.
//

import Foundation
@testable import RPS

class MockGameEngine: GameEngine {
    override func randomSelection() -> GameSelection {
        let number = 0
        return gameSelectionForNumber(value: number)
    }
    
}
