//
//  GameController+Game.swift
//  RPS
//
//  Created by Jeyakumaran Mayooresan on 6/8/19.
//  Copyright © 2019 Jeyakumaran Mayooresan. All rights reserved.
//

import UIKit

extension GameController {
    //MARK:- Game logics
    func buttonTouchedActions(selection: GameSelection) {
        disableButtons()
        if let gameEngine = self.gameEngine, gameEngine.gameType == .HumanVsBot   {
            timer?.invalidate()
        }
        timerView.isHidden = true
        if selection == .Rock {
            playerTwoSelectionImageView.image = UIImage(named: "rock")
        } else if selection == .Paper {
            playerTwoSelectionImageView.image = UIImage(named: "paper")
        } else if selection == .Scissors {
            playerTwoSelectionImageView.image = UIImage(named: "scissors")
        }
        
        checkTheWinner(selection: selection)
    }
    
    func checkTheWinner(selection: GameSelection) {
        guard let gameEngine = self.gameEngine else {
            return
        }
        let botSelection = gameEngine.randomSelection()
        
        if botSelection == .Rock {
            playerOneSelectionImageView.image = UIImage(named: "rock")
        } else if botSelection == .Paper {
            playerOneSelectionImageView.image = UIImage(named: "paper")
        } else if botSelection == .Scissors {
            playerOneSelectionImageView.image = UIImage(named: "scissors")
        }
        
        let winnerStateForPlayerTwo = gameEngine.checkWinner(selectionOne: botSelection, selectionTwo: selection)
        if winnerStateForPlayerTwo == .Draw {
            print("draw")
            updatesLabel.text = "DRAW"
        } else if winnerStateForPlayerTwo == .Lose {
            print("lost")
            if gameEngine.gameType == .HumanVsBot {
                updatesLabel.text = "BOT WON THE ROUND"
            } else {
                updatesLabel.text = "BOT 1 WON THE ROUND"
            }
            
            gameEngine.playerOneScored()
        } else if winnerStateForPlayerTwo == .Won {
            print("won")
            if gameEngine.gameType == .HumanVsBot {
                updatesLabel.text = "YOU WON THE ROUND"
            } else {
                updatesLabel.text = "BOT 2 WON THE ROUND"
            }
            gameEngine.playerTwoScored()
        }
        
        updateGameScore()
        if let gameEngine = self.gameEngine, gameEngine.gameType == .HumanVsBot   {
            startTimer()
        }
        
    }
    
    func updateGameScore() {
        if let gameEngine = gameEngine {
            UIView.animate(withDuration: 0.5) {
                if gameEngine.gameType == .HumanVsBot {
                    self.playerOneScoreLabel.text = "BOT: \(gameEngine.playerOne.playerScore)"
                    self.playerTwoScoreLabel.text = "YOU: \(gameEngine.playerTwo.playerScore)"
                } else if  gameEngine.gameType == .BotVsBot {
                    self.playerOneScoreLabel.text = "BOT 1: \(gameEngine.playerOne.playerScore)"
                    self.playerTwoScoreLabel.text = "BOT 2: \(gameEngine.playerTwo.playerScore)"
                }
            }
        }
    }
    
    func checkGameStatus() {
        guard let gameEngine = self.gameEngine else {
            return
        }
        var isGameOver: Bool = false
        var returnString: String = ""
        let numberOfRounds = gameEngine.numberOfRounds - 1
        
        if gameEngine.playerOne.playerScore > numberOfRounds && gameEngine.gameType == .HumanVsBot {
            isGameOver = true
            returnString = "BOT WON"
        } else if gameEngine.playerTwo.playerScore > numberOfRounds && gameEngine.gameType == .HumanVsBot{
            isGameOver = true
            returnString = "YOU WON"
        } else if gameEngine.playerOne.playerScore > numberOfRounds && gameEngine.gameType == .BotVsBot {
            isGameOver = true
            returnString = "BOT 1 WON"
        } else if gameEngine.playerTwo.playerScore > numberOfRounds && gameEngine.gameType == .BotVsBot{
            isGameOver = true
            returnString = "BOT 2 WON"
        }
        
        if isGameOver {
            if let gameDelegate = self.delegate {
                timer?.invalidate()
                self.dismiss(animated: true, completion: nil)
                gameEngine.resultString = returnString
                gameDelegate.didFinishPlayingGame(result: gameEngine)
            }
        }
        
        enableButtons()
        
    }
    
    //MARK:- Game Loop
    func startBotGameTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { (currTimer) in
            if let gameEngine = self.gameEngine {
                let botOneSelection = gameEngine.randomSelection()
                self.buttonTouchedActions(selection: botOneSelection)
            }
            
            self.checkGameStatus()
        }
        
    }
    
    func startTimer() {
        if let gameEngine = self.gameEngine {
            timerCount = gameEngine.waitingTime
            self.timerView.isHidden = false
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (currTimer) in
                if self.timerCount >= 0 {
                    self.timerLabel.text = "\(self.timerCount)"
                    self.timerCount -= 1
                } else {
                    print("timer stopped")
                    self.timerView.isHidden = true
                    self.timer?.invalidate()
                    if let gameEngine = self.gameEngine {
                        gameEngine.playerOneScored()
                    }
                    
                    self.updateGameScore()
                    self.timerCount = gameEngine.waitingTime
                    self.startTimer()
                }
                
                self.checkGameStatus()
            }
        }
        
    }
}
