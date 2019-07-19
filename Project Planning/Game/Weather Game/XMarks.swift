//
//  XMarks.swift
//  Weather Game
//
//  Created by Julia Hines on 7/19/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import SpriteKit

class XMarks: SKNode {
    
    var xArray = [SKSpriteNode]()
    var numXs = Int()
    
    let blackXPic = SKTexture(imageNamed: "x black")
    let redXPic = SKTexture(imageNamed: "x red")
        
        
    init(num: Int = 0) {
        super.init()
        
        numXs = num
        
        for i in 0..<num {
            
            let xMark = SKSpriteNode(imageNamed: "x black")
            xMark.size = CGSize(width: 60, height: 60)
            xMark.position.x = -CGFloat(i)*70
            addChild(xMark)
            xArray.append(xMark)
        }
        
    }
    
    func update(num: Int) {
        
        if num <= numXs {
            xArray[xArray.count-num].texture = redXPic
        }
        
    }
    
    func reset() {
        
        for xMark in xArray {
            xMark.texture = blackXPic
        }
    }
    required init?(coder aDecoder:NSCoder) {
        fatalError ("init(coder:) has not been implemented")
    }
}
