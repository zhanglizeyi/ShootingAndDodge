//
//  GameViewController.swift
//  GamePro
//
//  Created by ze li on 8/27/15.
//  Copyright (c) 2015 ze li. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      let scene = GameScene(size: view.bounds.size)
      
      // Configure the view.
      let skView = self.view as! SKView
      skView.showsFPS = true
      skView.showsNodeCount = true
      
      /* Sprite Kit applies additional optimizations to improve rendering performance */
      skView.ignoresSiblingOrder = true
      
      /* Set the scale mode to scale to fit the window */
      scene.scaleMode = .ResizeFill
      
      skView.presentScene(scene)
      }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
