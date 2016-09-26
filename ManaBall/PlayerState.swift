//
//  ManaBall.swift
//  ManaBall
//
//  Created by Licetus on 9/23/16.
//  Copyright © 2016 Licetus. All rights reserved.
//

import Foundation

class PlayerState: CustomStringConvertible {
    
    var score = 0
    var acted = false
    var life = 50
    var mana = 0
    var shiled = 0
	var shiledLock = false
	var damage = 0
	var skill: Skill? = nil

	
	func initTurn() {
		acted = false
		shiled = 0
		damage = 0
		skill = nil
	}
	
	var description: String {
		return "score=\(score)\nacted=\(acted)\nlife=\(life)\nmana=\(mana)\nshiled=\(shiled)\ndamage=\(damage)"
	}
}
























