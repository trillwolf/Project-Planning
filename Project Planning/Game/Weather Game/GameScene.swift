//
//  GameScene.swift
//  Weather Game
//
//  Created by GWC on 7/17/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import SpriteKit

enum GamePhase {
    case Ready
    case InPlay
    case GameOver
}

protocol GameOver {
    func gameOverPressed()
}

class GameScene: SKScene {
    
    var gameOverDelegate: GameOver?
    var gamePhase = GamePhase.Ready
    var score = 0
    var best = 0
    var misses = 0
    let missesMax = 3
    
    var promptLabel = SKLabelNode()
    var scoreLabel = SKLabelNode()
    var bestLabel = SKLabelNode()
    
    
    var fruitThrowTimer = Timer()
    var xMarks = XMarks()
    var explodeOverlay = SKShapeNode()
    
    override func didMove(to view: SKView) {
        
         physicsWorld.gravity = CGVector(dx: 0, dy: -3)
        
        scoreLabel = childNode(withName: "score label") as! SKLabelNode
        scoreLabel.text = "Score: \(score)"
        
        promptLabel = childNode(withName: "prompt label") as! SKLabelNode
        
        bestLabel = childNode(withName: "best label") as! SKLabelNode
        bestLabel.text = "Best: \(best)"
        
        xMarks = XMarks(num: missesMax)
        xMarks.position = CGPoint(x: size.width-60, y: size.height-100)
        addChild(xMarks)
        
        
        explodeOverlay = SKShapeNode(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        explodeOverlay.fillColor = .white
        addChild(explodeOverlay)
        explodeOverlay.alpha = 0
        
        //load data
        
        if UserDefaults.standard.object(forKey: "best") != nil {
            best = UserDefaults.standard.object(forKey: "best") as! Int
        }
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gamePhase == .Ready {
            gamePhase = .InPlay
            startGame()
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let location =  t.location(in: self)
            let previous = t.previousLocation(in: self)
            for node in nodes (at:location){
                if node.name == "fruit" {
                    score += 1
                    scoreLabel.text = "\(score)"
                    node.removeFromParent()
                    particleEffect(position: node.position)
                }
                
                if node.name == "bomb" {
                    bombExplode()
                    gameOver()
                    particleEffect(position: node.position)
                }
            }
            
            let line = TrailLine(pos: location, lastPos: previous, width: 8, color: .black)
            addChild(line)

        }
    }
    
    override func didSimulatePhysics() {
        
        for fruit in children {
            if fruit.position.y < -100 {
                fruit.removeFromParent()
                if fruit.name == "fruit" {
                    missFruits()
                }
            }
        }
        
    }
    
    func startGame(){
        score = 0
        
        bestLabel.text = "Best: \(best)"
       
        scoreLabel.text = "Score: \(score)"
        promptLabel.isHidden = true
       
        misses = 0
        
        xMarks.reset()
        
        fruitThrowTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: {_ in self.createFruits()})
        
    }
    
    func createFruits(){
        
        print ("fruits")
        
        let numberOfFruits = 1 + Int(arc4random_uniform(UInt32(4)))
        
        for _ in 0..<numberOfFruits {
            let fruit = Fruit()
            fruit.position.x = randomCGFloat(0, size.width)
            fruit.position.y = -100
            addChild(fruit)
            
            if fruit.position.x < size.width/2 {
                fruit.physicsBody?.velocity.dx = randomCGFloat(0,200)
            }
            
            if fruit.position.x > size.width/2 {
                fruit.physicsBody?.velocity.dx = randomCGFloat(0,-200)
            }
            
            fruit.physicsBody?.velocity.dy = randomCGFloat(500, 800)
            fruit.physicsBody?.angularVelocity = randomCGFloat(-5,5)
        }
    }
    @objc func returnHome(){
        self.gameOverDelegate?.gameOverPressed()

    }
    func missFruits(){
        misses += 1
        xMarks.update(num: misses)
        if misses == missesMax {
            gameOver()
            
    
           

        }
        
    }
    
    
    func bombExplode () {
        
        for case let fruit as Fruit in children {
            fruit.removeFromParent()
            //explode
            particleEffect(position: fruit.position)
        }
        
        explodeOverlay.run(SKAction.sequence([
            SKAction.fadeAlpha(to: 1, duration: 0),
            SKAction.wait(forDuration: 0.2),
            SKAction.fadeAlpha(to: 0, duration: 0),
            SKAction.fadeAlpha(to: 1, duration: 0),
            SKAction.wait(forDuration: 0.2),
            SKAction.fadeAlpha(to: 0, duration: 0)
        ]))
        
    }
    
    func gameOver(){
        
        if score > best {
            best = score
            
            //save data
            UserDefaults.standard.set(best, forKey: "best")
            UserDefaults.standard.synchronize()
        }
        
        bestLabel.text = "Best: \(best)"
        
        scoreLabel.text = "Score: \(score)"
        
        promptLabel.isHidden = false
        promptLabel.text = "Game Over"
        promptLabel.setScale(0)
        promptLabel.run(SKAction.scale(to: 1,duration: 0.3))
        
        gamePhase = .GameOver
        
        fruitThrowTimer.invalidate()
        
         perform(#selector(returnHome), with: nil, afterDelay: 5.0)
    
    }
    
    func particleEffect(position: CGPoint) {
        
        let emitter = SKEmitterNode (fileNamed: "Explode.sks")
        emitter?.position = position
        addChild(emitter!)
    }
 

    
}

