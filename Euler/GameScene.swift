//
//  GameScene.swift
//  Euler
//
//  Created by Patrick Naughton on 9/25/14.
//  Copyright (c) 2014 Orange Banana. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let fracNode = FractionNode();

    override func didMoveToView(view: SKView) {
        fracNode.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) + 200)
        self.addChild(fracNode)

        let clock = ClockNode();
        clock.position = CGPoint(x:CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame) - 36)
        self.addChild(clock)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        fracNode.setRandomValue()
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            fracNode.position = location;

            /*
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
*/
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
