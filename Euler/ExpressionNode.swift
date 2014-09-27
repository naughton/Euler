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

    let size = 64
    let gap = 4

    init(expression: Expression) {
        mExpression = expression
        opLabel = SKLabelNode(fontNamed:"Optima-Bold")
        opLabel.horizontalAlignmentMode =  SKLabelHorizontalAlignmentMode.Center
        opLabel.verticalAlignmentMode =  SKLabelVerticalAlignmentMode.Center
        opLabel.name = "op"
        opLabel.text = String(expression.op.toRaw())
        opLabel.fontSize = 64

         leftNode = FractionNode(fraction: expression.left)
        leftNode.position = CGPoint(x: -60, y: 0);
         rightNode = FractionNode(fraction: expression.right)
        rightNode.position = CGPoint(x: 60, y: 0);
        super.init()

        name = "expression"
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
    }

    func setExpression(expr: Expression) {
        mExpression = expr
        leftNode.setFraction(expr.left)
        rightNode.setFraction(expr.right)
        update()
    }
}