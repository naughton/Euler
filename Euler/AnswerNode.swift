//
//  FractionNode.swift
//  Euler
//
//  Created by Patrick Naughton on 6/12/14.
//  Copyright (c) 2014 Orange Banana. All rights reserved.
//

import SpriteKit
typealias ClickClosureType = (answer: AnswerNode) -> ()

class AnswerNode : SKNode
{
    var back: SKShapeNode
    var fraction: Fraction
    var fractionNode: FractionNode
    var clicked: ClickClosureType?
    var isEnabled: Bool

    init(fraction: Fraction, clicked: ClickClosureType!) {
        self.fraction = fraction
        self.clicked = clicked
        isEnabled = true
        let size = 64
        let cornerSize = CGFloat(size / 8)
        let rect = CGRect(x: -size/2, y: -size/2, width:size, height:size)
        let path = CGPathCreateWithRoundedRect(rect, cornerSize, cornerSize, nil)
        back = SKShapeNode(path: path)
        back.fillColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        fractionNode = FractionNode(fraction:fraction, proper:true)
        fractionNode.xScale = 0.25
        fractionNode.yScale = 0.25
        super.init()
        addChild(back)
        addChild(fractionNode)
        userInteractionEnabled = true
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setFraction(fraction: Fraction) {
        self.fraction = fraction
        self.fractionNode.setFraction(fraction)
    }

    var isSelected: Bool = false {
        didSet {
            back.fillColor = UIColor(red: 1, green: 1, blue: 1, alpha:isSelected ? 1.0 : 0.5)
        }
    }

    var isCorrect: Bool = false {
        didSet {
            back.fillColor = isCorrect ? UIColor.greenColor() : UIColor.redColor()
        }
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)  {
        if (isEnabled) {
            let touch: AnyObject! = touches.anyObject()
            let touchLocation = touch.locationInNode(parent)
            isSelected = true
        }
    }

    override func touchesMoved(touches: NSSet, withEvent event: UIEvent)  {
        if (isEnabled) {
            let touch: AnyObject! = touches.anyObject()
            let touchLocation = touch.locationInNode(parent)
            let bounds = CGRectOffset(back.frame, frame.origin.x, frame.origin.y)

            if (CGRectContainsPoint(bounds, touchLocation)) {
                isSelected = true
            } else {
                isSelected = false
                println("\(bounds) ! \(touchLocation)");
            }
        }
    }

    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if (isEnabled) {
            isSelected = false

            if (clicked != nil) {
                let touch: AnyObject! = touches.anyObject()
                let touchLocation = touch.locationInNode(parent)
                let bounds = CGRectOffset(back.frame, frame.origin.x, frame.origin.y)

                if (CGRectContainsPoint(bounds, touchLocation) ) {
                    clicked!(answer: self)
                }
            }
            
        }
    }
}