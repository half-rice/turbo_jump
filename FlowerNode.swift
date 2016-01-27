//
//  FlowerNode.swift
//  Turbo Jump
//
//  Created by surrus on 1/26/16.
//  Copyright © 2016 surrus. All rights reserved.
//

import SpriteKit

enum FlowerType:Int {
  case normalFlower = 0
  case specialFlower = 1
}

class FlowerNode: GenericNode {
  var flowerType:FlowerType!
  
  override func collisionWithPlayer(player: SKNode) -> Bool {
    player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 400)
    
    self.removeFromParent()
    
    return true
  }
}
