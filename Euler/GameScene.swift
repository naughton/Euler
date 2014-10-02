//
//  GameScene.swift
//  Euler
//
//  Created by Patrick Naughton on 9/25/14.
//  Copyright (c) 2014 Orange Banana. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    var current: Expression?
    var exprNode: ExpressionNode?
    var answerNodes: [AnswerNode] = []

    override func didMoveToView(view: SKView) {

        let bgImage = SKSpriteNode(imageNamed: "background")
        bgImage.zPosition = -1
        bgImage.position = CGPoint(x:view.bounds.width / 2, y: view.bounds.height / 2)
        bgImage.xScale = 2.2
        bgImage.yScale = 2.0
        println("\(bgImage.xScale), \(view.bounds.width), \(bgImage.size.width)")

        self.addChild(bgImage)

        let expr = Expression(left: Fraction(n:1, d: 2), op: .plus, right: Fraction(n:1, d: 5))
        exprNode = ExpressionNode(expression: expr)
        exprNode!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        self.addChild(exprNode!)

        let skip = self.size.width / 4
        var xp = skip/2
        
        for x in 0..<4 {
            var node = AnswerNode(fraction: expr.value, clicked:click);
            node.position = CGPoint(x: xp,
                y:CGRectGetMinY(self.frame) + node.calculateAccumulatedFrame().height)
            xp += skip
            addChild(node)
            answerNodes.append(node);
        }
        current = expr

        let clock = ClockNode();
        clock.position = CGPoint(x:CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame) - 36)
        self.addChild(clock)
    }

    func click(answer: AnswerNode) {
        println("You clicked \(answer.fraction.description)");
        for a in answerNodes {
            a.isEnabled = false
            if (a == answer) {
                a.isCorrect = current!.value == a.fraction
            }
        }
    }

    func pickAnswers(expr:Expression) {
        for a in answerNodes {
            a.isEnabled = true
            a.isSelected = false
            a.setFraction(randomFraction())
        }
        answerNodes[randomInt(0, answerNodes.count - 1)].setFraction(expr.value)
    }

    func randomFraction() -> Fraction {
        var d = randomInt(0, 10)
        var n = randomInt(1, d)
        return Fraction(n:d, d: 1)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let expr = Expression(left: randomFraction(), op: .times, right: randomFraction())
        exprNode!.setExpression(expr)
        pickAnswers(expr)
        current = expr
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            exprNode!.position = location;
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
