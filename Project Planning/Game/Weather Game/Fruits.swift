//
//  Fruits.swift
//  Weather Game
//
//  Created by GWC on 7/17/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import SpriteKit

class Fruit: SKNode {
    
    let emojis = ["🌊", "🔥", "❄️"]
    
    let bombEmoji = "💣"
    
    override init() {
        super.init()
        
        var emoji = ""
        
        if randomCGFloat(0,1) < 0.9 {
            name = "fruit"
            let n = Int(arc4random_uniform(UInt32(emojis.count)))
            emoji = emojis[n]
        } else {
            name = "bomb"
            emoji = bombEmoji
        }
        
        let label = SKLabelNode(text: emoji)
        label.fontSize = 100
        label.verticalAlignmentMode = .center
        addChild(label)
        
        physicsBody = SKPhysicsBody()
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
}
