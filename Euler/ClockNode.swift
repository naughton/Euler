//
//  ClockNode.swift
//  Euler
//
//  Created by Patrick Naughton on 9/25/14.
//  Copyright (c) 2014 Orange Banana. All rights reserved.
//


import SpriteKit

class ClockNode : SKNode
{
    override init() {
        let back = SKShapeNode(circleOfRadius: 30)
        back.lineWidth = 2.0
        back.strokeColor = UIColor.redColor()
        back.fillColor = UIColor(white: 1.0, alpha: 0.5)
        back.glowWidth = 2.0

        let path: CGMutablePathRef = CGPathCreateMutable()

        CGPathAddArc(path, nil, 0.0, 0.0, 20, 0.0, CGFloat(M_PI_2), true)

        let arc = SKShapeNode(path: path)
        arc.lineWidth = 16.0
        arc.strokeColor = UIColor.orangeColor()
        arc.fillColor = UIColor.clearColor()

        let label = SKLabelNode(fontNamed:"AvenirNext-Heavy")
        label.text = "10"
        label.fontColor = UIColor.blackColor()
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center;
        label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center;


        super.init()

        name = "clock"
        addChild(back);
        addChild(arc);
        addChild(label);
        let duration = 10.0;
        let action = SKAction.customActionWithDuration(duration) { node, elapsedTime in
            let t = Int(CGFloat(duration) - elapsedTime) + 1;
            let path: CGMutablePathRef = CGPathCreateMutable()
            let angle = M_PI_2 - 2.0 * M_PI * Double(elapsedTime)
            CGPathAddArc(path, nil, 0.0, 0.0, 20, CGFloat(angle), CGFloat(M_PI_2), true)
            if let shape = node as? SKShapeNode {
                shape.path = path;
                label.text = String(t);
            }
        }
        arc.runAction(SKAction.repeatAction(action, count:10))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
