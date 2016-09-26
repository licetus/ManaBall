//
//  Skill.swift
//  ManaBall
//
//  Created by Licetus on 9/23/16.
//  Copyright © 2016 Licetus. All rights reserved.
//

import Foundation


class Skill {
    var player: PlayerState
    
    init(player: PlayerState) {
        self.player = player
    }
    func act() {
        fatalError("please implement it")
    }
}


class Charge: Skill {
    override func act() {
		if player.mana < 3 {
			player.mana += 1
		}
    }
}

class Defend: Skill {
    override func act() {
		if player.shiledLock == true {
			player.shiledLock = false
		}else if player.shiledLock == false {
			player.shiled += 3
			player.shiledLock = true
		}
    }
}

class Hit: Skill {
    override func act() {
        player.damage += 1
    }
}

class ManaBall: Skill {
    override func act() {
		if player.mana > 0 {
		player.damage += 3
        player.mana -= 1
		}
		
    }
}

class HugeManaBall: Skill {
    override func act() {
		if player.mana == 3 {
		player.damage += 5
        player.mana -= 3
		}
    }
}

class SkillFactory {
    static func createSkill(tag: Int, player: PlayerState) -> Skill {
        switch tag {
        case 0: return Charge(player: player)
        case 1: return Defend(player: player)
        case 2: return Hit(player: player)
        case 3: return ManaBall(player: player)
        case 4: return HugeManaBall(player: player)
        default: fatalError("BOOM!")
        }
    }
}
