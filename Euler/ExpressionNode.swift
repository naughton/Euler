//
//  FractionNode.swift
//  Euler
//
//  Created by Patrick Naughton on 6/12/14.
//  Copyright (c) 2014 Orange Banana. All rights reserved.
//

import SpriteKit

class ExpressionNode : SKNode
{
    var mExpression: Expression
    var opLabel: SKLabelNode
    var leftNode: FractionNode
    var rightNode: FractionNode

    init(expression: Expression) {
        mExpression = expression
        opLabel = SKLabelNode(fontNamed:"Optima-Bold")
        opLabel.horizontalAlignmentMode =  SKLabelHorizontalAlignmentMode.Center
        opLabel.verticalAlignmentMode =  SKLabelVerticalAlignmentMode.Center
        opLabel.name = "op"
        opLabel.text = String(expression.op.toRaw())

        leftNode = FractionNode(fraction: expression.left)
        rightNode = FractionNode(fraction: expression.right)
        opLabel.fontSize = rightNode.fontSize
        opLabel.fontColor = rightNode.color

        super.init()
        update()
        
        addChild(opLabel)
        addChild(leftNode)
        addChild(rightNode)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update() {
        opLabel.text = String(mExpression.op.toRaw())
        leftNode.update()
        rightNode.update()

        let gap:CGFloat = 4

        leftNode.position = CGPoint(x: -(opLabel.frame.width + leftNode.calculateAccumulatedFrame().width) / 2.0 - gap, y: 0)
        rightNode.position = CGPoint(x: (opLabel.frame.width + rightNode.calculateAccumulatedFrame().width) / 2.0 + gap, y: 0)
    }

    func setExpression(expr: Expression) {
        mExpression = expr
        leftNode.setFraction(expr.left)
        rightNode.setFraction(expr.right)
        update()
    }
}