//
//  GameViewController.swift
//  Turbo Jump
//
//  Created by surrus on 1/25/16.
//  Copyright (c) 2016 surrus. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let skView = self.view as! SKView
    let scene = GameScene(size: skView.bounds.size)
    scene.scaleMode = .AspectFit
    
    skView.presentScene(scene)
    
  }
  
  override func shouldAutorotate() -> Bool {
    return true
  }
  
  override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
    if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
      return .AllButUpsideDown
    } else {
      return .All
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return true
  }
}
