//
//  ViewController.swift
//  ManaBall
//
//  Created by Licetus on 9/23/16.
//  Copyright © 2016 Licetus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var players = [PlayerState(), PlayerState()]
    var winner = 0
    var turns = 0
	
	@IBOutlet weak var labelPlayerOneState: UILabel!
	@IBOutlet weak var labelPlayerTwoState: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func performAction(_ sender: AnyObject) {
        let button = sender as! UIButton
        let playerTag = button.tag / 5
        let skillTag = button.tag % 5
        let player = players[playerTag]
        updatePlayersState()
		
        // read player skill tag
        if player.acted == false {
            let skill = SkillFactory.createSkill(tag: skillTag, player: player)
            player.skill = skill
            player.acted = true
			updatePlayersState()
        }
	    if players[0].acted == true && players[1].acted == true {
            runGame()
		}	
    }

    func initGame() {
       
    }

    func runGame() {
		for player in players {
			player.skill?.act()
			updatePlayersState()
		}
		for i in 0...1 {
			attack(from: players[i], target: players[1 - i])
			updatePlayersState()
		}
		
		let gameState = checkGameOver()
		switch gameState {
		case .unfinished:
			for player in players {
				player.initTurn()
			}
			turns += 1
		default:
			gameOver( gameState: gameState )
		}
	
    }
        
        
	func attack(from: PlayerState, target: PlayerState) {
		from.damage -= target.shiled
		if from.damage < 0 { from.damage = 0 }
		target.life -= from.damage
		if target.life < 0 { target.life = 0 }
	}
        

	func checkGameOver() -> GameState {
		if players[0].life > 0 && players[1].life > 0 {
			return GameState.unfinished
		} else if players[0].life == 0 && players[1].life == 0 {
			return GameState.draw
		} else if players[0].life > 0 {
			return GameState.majorWin
		} else {
			return GameState.minorWin
		}
	}
	
	func gameOver(gameState: GameState) {
		switch gameState {
		case <#pattern#>:
			<#code#>
		default:
			<#code#>
		}
		
	}

	func gameOverText(gameState: GameState) {
	
	}
	
	func updatePlayersState() {
		labelPlayerOneState.text = players[0].description
		labelPlayerTwoState.text = players[1].description
	}
	
	
}







