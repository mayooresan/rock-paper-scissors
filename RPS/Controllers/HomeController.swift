//
//  HomeController.swift
//  RPS
//
//  Created by Jeyakumaran Mayooresan on 6/8/19.
//  Copyright © 2019 Jeyakumaran Mayooresan. All rights reserved.
//

import UIKit

protocol GameDelegate {
    func didFinishPlayingGame(result: GameEngine)
    func didPlaySameGame(result: GameEngine)
}

class HomeController: UIViewController {
    var gameEngine: GameEngine = GameEngine(scoreOne: 0, scoreTwo: 0, gameType: .HumanVsBot)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playerBotButtonTapped(_ sender: Any) {
        gameEngine = GameEngine(scoreOne: 0, scoreTwo: 0, gameType: .HumanVsBot)
        self.performSegue(withIdentifier: "gamesegue", sender: self)
    }
    
    
    @IBAction func botBotButtonTapped(_ sender: Any) {
        gameEngine = GameEngine(scoreOne: 0, scoreTwo: 0, gameType: .BotVsBot)
        self.performSegue(withIdentifier: "gamesegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gamesegue" {
            if let vc = segue.destination as? GameController {
                vc.delegate = self
                vc.gameEngine = self.gameEngine
            }
        } else if segue.identifier == "resultsegue" {
            if let vc = segue.destination as? ResultController {
                vc.delegate = self
                vc.gameEngine = self.gameEngine
            }
        }
    }
}

extension HomeController: GameDelegate {
    func didPlaySameGame(result: GameEngine) {
        self.gameEngine = GameEngine(scoreOne: 0, scoreTwo: 0, gameType: result.gameType)
        self.performSegue(withIdentifier: "gamesegue", sender: self)
    }
    
    func didFinishPlayingGame(result: GameEngine) {
        self.gameEngine = result
        self.performSegue(withIdentifier: "resultsegue", sender: self)
    }
}
