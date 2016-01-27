//
//  GameScene.swift
//  Turbo Jump
//
//  Created by surrus on 1/25/16.
//  Copyright (c) 2016 surrus. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
  
  var background:SKNode!
  var midground:SKNode!
  var foreground:SKNode!
  
  var hud:SKNode!
  
  var player:SKNode!
  
  var scaleFactor:CGFloat!
  
  var startButton = SKSpriteNode(imageNamed: "TapToStart")
  
  var endOfGamePosition = 0
  
  let motionManager = CMMotionManager()
  
  var xAcceleration:CGFloat = 0.0
  
  var scoreLabel:SKLabelNode!
  var flowerLabel:SKLabelNode!
  
  var playerMaxY:Int!
  
  var gameOver = false
  
  
  
  required init?(coder aDecoder: NSCoder){
    super.init(coder: aDecoder)
  }
  
  override init(size:CGSize) {
    super.init(size: size)
    
    backgroundColor = SKColor.whiteColor()
    
    scaleFactor = self.size.width / 320
    
    background = createBackground()
    addChild(background)
    
    midground = createMidground()
    addChild(midground)
    
    foreground = SKNode()
    addChild(foreground)
    
    player = createPlayer()
    foreground.addChild(player)
    
    let platform = createPlatformAtPosition(CGPoint(x: 160, y: 320), ofType: PlatformType.normalBrick)
    foreground.addChild(platform)
    
    let flower = createFlowerAtPosition(CGPoint(x:160, y:220), ofType: FlowerType.specialFlower)
    foreground.addChild(flower)
    
    physicsWorld.gravity = CGVector(dx: 0, dy: -2)
    physicsWorld.contactDelegate = self
    
  }
  
  func didBeginContact(contact: SKPhysicsContact) {
    var otherNode:SKNode!
    
    if contact.bodyA.node != player {
      otherNode = contact.bodyA.node
    }
    else {
      otherNode = contact.bodyB.node
    }
    
    (otherNode as! GenericNode).collisionWithPlayer(player)
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    player.physicsBody?.dynamic = true
    player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 20))
    
  }
  
  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
  }
}
