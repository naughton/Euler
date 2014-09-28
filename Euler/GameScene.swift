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
    var answerNodes: [FractionNode] = []

    override func didMoveToView(view: SKView) {

        let bgImage = SKSpriteNode(imageNamed: "background")
        bgImage.zPosition = -1
        self.addChild(bgImage)

        var expr = Expression(left: Fraction(n:1, d: 2), op: .plus, right: Fraction(n:1, d: 5))
        exprNode = ExpressionNode(expression: expr)
        exprNode!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        self.addChild(exprNode!)

        let skip = self.size.width / 4
        var xp = skip/2
        //println("size: \(self.size)")
        for x in 0..<4 {
            var node = FractionNode(fraction: expr.value, proper: true);
            node.xScale = 0.4
            node.yScale = 0.4
            node.position = CGPoint(x: xp,
                y:CGRectGetMinY(self.frame) + node.calculateAccumulatedFrame().height)
            xp += skip
            addChild(node)
            answerNodes.append(node);
        }

        let clock = ClockNode();
        clock.position = CGPoint(x:CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame) - 36)
        self.addChild(clock)
    }

    func pickAnswers(expr:Expression) {
        answerNodes[0].setFraction(expr.value)
        answerNodes[1].setFraction(randomFraction())
        answerNodes[2].setFraction(randomFraction())
        answerNodes[3].setFraction(randomFraction())
    }

    func randomFraction() -> Fraction {
        var d = randomInt(2, 10)
        return Fraction(n:randomInt(1, d), d: d)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var d1 = randomInt(2, 10)
        var d2 = randomInt(2, 10)
        var expr = Expression(left: randomFraction(), op: .plus, right: randomFraction())
        exprNode!.setExpression(expr)
        pickAnswers(expr)
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            exprNode!.position = location;
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
