//
//  GenericNode.swift
//  Turbo Jump
//
//  Created by surrus on 1/25/16.
//  Copyright © 2016 surrus. All rights reserved.
//

import SpriteKit

struct CollisionBitMask {
  static let Player:UInt32 = 0x00
  static let Flower:UInt32 = 0x01
  static let Brick:UInt32 = 0x02
}

enum PlatformType:Int {
  case normalBrick = 0
  case breakableBrick = 1
}

class GenericNode: SKNode {

}
