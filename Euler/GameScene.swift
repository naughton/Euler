//
//  GameScene.swift
//  Euler
//
//  Created by Patrick Naughton on 9/25/14.
//  Copyright (c) 2014 Orange Banana. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    var exprNode: ExpressionNode?
    var answerNode: FractionNode?

    override func didMoveToView(view: SKView) {

        var expr = Expression(left: Fraction(n:1, d: 2), op: .plus, right: Fraction(n:1, d: 5))
        exprNode = ExpressionNode(expression: expr)
        exprNode!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        self.addChild(exprNode!)

        answerNode = FractionNode(fraction: expr.value());
        answerNode!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMinY(self.frame) + 60)
        self.addChild(answerNode!)

        let clock = ClockNode();
        clock.position = CGPoint(x:CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame) - 36)
        self.addChild(clock)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var d1 = randomInt(2, 10)
        var d2 = randomInt(2, 10)
        var expr = Expression(left: Fraction(n:randomInt(2, d1), d: d1),
            op: .plus,
            right: Fraction(n:randomInt(2, d2), d: d2))
        exprNode!.setExpression(expr)
        answerNode!.setFraction(expr.value())
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            exprNode!.position = location;
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
