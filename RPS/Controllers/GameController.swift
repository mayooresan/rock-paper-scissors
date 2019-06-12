//
//  GameController.swift
//  RPS
//
//  Created by Jeyakumaran Mayooresan on 6/8/19.
//  Copyright © 2019 Jeyakumaran Mayooresan. All rights reserved.
//

import UIKit
class GameController: UIViewController {
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var playerOneScoreLabel: UILabel!
    @IBOutlet weak var playerTwoScoreLabel: UILabel!
    @IBOutlet weak var playerOneSelectionImageView: UIImageView!
    @IBOutlet weak var playerTwoSelectionImageView: UIImageView!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    
    @IBOutlet weak var updatesLabel: UILabel!
    
    var gameEngine: GameEngine?
    var timerCount = 0
    var timer: Timer?
    var delegate: GameDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let gameEngine = self.gameEngine {
            timerCount = gameEngine.waitingTime
        }
        
        setupUI()
        updateGameScore()
        
        if let gameEngine = self.gameEngine, gameEngine.gameType == .BotVsBot   {
            disableButtons()
            startBotGameTimer()
        } else {
            startTimer()
        }
    }
    
    //MARK:- UI Stuff
    func setupUI() {
        timerView.layer.cornerRadius = 37.5
        timerView.layer.borderColor = UIColor.white.cgColor
        timerView.layer.borderWidth = 1
    }
    
    func disableButtons() {
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorButton.isEnabled = false
    }
    
    func enableButtons() {
        if let gameEngine = self.gameEngine, gameEngine.gameType == .HumanVsBot   {
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorButton.isEnabled = true
        }
        
    }
    
    //MARK:- IBActions
    @IBAction func rockButtonTouched(_ sender: Any) {
        buttonTouchedActions(selection: .Rock)
    }
    
    @IBAction func paperButtonTouched(_ sender: Any) {
        buttonTouchedActions(selection: .Paper)
    }
    
    @IBAction func scissorsButtonTouched(_ sender: Any) {
        buttonTouchedActions(selection: .Scissors)
    }
    
    
}
