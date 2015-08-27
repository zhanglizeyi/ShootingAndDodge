//
//  GameScene.swift
//  GamePro
//
//  Created by ze li on 8/27/15.
//  Copyright (c) 2015 ze li. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  
  
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let player = SKSpriteNode(imageNamed: "player")
        //myLabel.text = "Hello, World!";
        //myLabel.fontSize = 45;
        //myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        backgroundColor = SKColor.whiteColor()
      player.position = CGPoint(x: size.width*0.1,y: size.height*0.5)
        self.addChild(player)
      
      runAction(SKAction.repeatActionForever(
        SKAction.sequence([
          SKAction.runBlock(addMonster),SKAction.waitForDuration(1.0)
        ])
      ))
    }
  
  
  func random()->CGFloat{
    return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
  }
  
  func random_point(min:CGFloat, max:CGFloat) -> CGFloat{
    return random()*(max-min)+min
  }
  
  func addMonster(){
  
    //create sprite
    let monster = SKSpriteNode(imageNamed: "monster")
    
    
    //determine where to spawn the monster along the Y axis
    let actualY = random_point(monster.size.height/2, max: size.height - monster.size.height/2)
  
    //add the monster to the scene
    monster.position = CGPoint(x:size.width + monster.size.width/2, y: actualY)
    
    addChild(monster)
    
    //determine speed of the monster
    let actualDuration = random_point(CGFloat(5.0), max: CGFloat(5.0))
    
    //create the actions
    let actionMove = SKAction.moveTo(CGPoint(x: -monster.size.width/2, y:actualY), duration: NSTimeInterval(actualDuration))
    let actionMoveDone = SKAction.removeFromParent()
    monster.runAction(SKAction.sequence([actionMove,actionMoveDone]))
  }
  
  
  /*
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
    */
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
