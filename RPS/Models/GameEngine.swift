//
//  GameEngine.swift
//  RPS
//
//  Created by Jeyakumaran Mayooresan on 6/8/19.
//  Copyright © 2019 Jeyakumaran Mayooresan. All rights reserved.
//

import UIKit

enum GameType {
    case HumanVsBot
    case BotVsBot
}

enum GameSelection {
    case Rock
    case Paper
    case Scissors
    case Other
}

enum GameVictoryState {
    case Won
    case Lose
    case Draw
}

class GameEngine {
    var playerOne = Player(playerScore: 0, playerType: .playerOne)
    var playerTwo = Player(playerScore: 0, playerType: .playerTwo)
    
    var gameType: GameType = .HumanVsBot
    var resultString: String = ""
    //number of seconds before user has to make a choice
    var waitingTime = 5
    //minimum number of rounds per game
    var numberOfRounds = 3
    
    init(scoreOne: Int, scoreTwo: Int, gameType: GameType) {
        self.playerOne.playerScore = scoreOne
        self.playerTwo.playerScore = scoreTwo
        self.gameType = gameType
    }
    
    func playerOneScored() {
        self.playerOne.playerScore += 1
    }
    
    func playerTwoScored() {
        self.playerTwo.playerScore += 1
    }
    
    func hasAnyOneWon() -> Players?{
        if self.playerOne.playerScore > 2 {
            return .playerOne
        } else if self.playerTwo.playerScore > 2 {
            return .playerTwo
        } else {
            return nil
        }
    }
    
    func randomSelection() -> GameSelection {
        let number = Int.random(in: 0...2)
        return gameSelectionForNumber(value: number)
    }
    
    func gameSelectionForNumber(value: Int) -> GameSelection {
        if value == 0 {
            return .Rock
        } else if value == 1 {
            return .Paper
        } else {
            return .Scissors
        }
    }
    
    func checkWinner(selectionOne: GameSelection, selectionTwo: GameSelection) -> GameVictoryState {
        // state is checked from the perspective of selectionTwo (human player)
        if selectionOne == selectionTwo {
            return .Draw
        }
        
        if selectionOne == .Rock && selectionTwo == .Scissors {
            return .Lose
        } else if selectionOne == .Rock && selectionTwo == .Paper {
            return .Won
        }  else if selectionOne == .Paper && selectionTwo == .Rock {
            return .Lose
        } else if selectionOne == .Paper && selectionTwo == .Scissors {
            return .Won
        } else if selectionOne == .Scissors && selectionTwo == .Rock {
            return .Won
        } else if selectionOne == .Scissors && selectionTwo == .Paper {
            return .Lose
        } else {
            return .Draw
        }
    }
}

