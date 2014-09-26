//
//  FractionNode.swift
//  Euler
//
//  Created by Patrick Naughton on 6/12/14.
//  Copyright (c) 2014 Orange Banana. All rights reserved.
//

import SpriteKit

class FractionNode : SKNode
{
    var mFraction: Fraction
    var nLabel: SKLabelNode
    var dLabel: SKLabelNode

    let size = 64
    let gap = 4

    override init() {
        let f = Fraction.random(100)
        nLabel = FractionNode.label("numerator", n:f.n, x:0, y:gap)
        dLabel = FractionNode.label("denominator", n:f.d, x:0, y:-gap)
        dLabel.position = CGPoint(x:dLabel.position.x, y:dLabel.position.y - dLabel.frame.height)
        var divideLine = SKShapeNode(rectOfSize: CGSize(width: dLabel.frame.size.width + 40,height: 4))
        divideLine.position = CGPointMake(0,0);
        divideLine.strokeColor =  UIColor.orangeColor()
        divideLine.fillColor = divideLine.strokeColor

        var s = nLabel.frame
        mFraction = f
        super.init()
        name = "fraction"
        addChild(nLabel)
        addChild(dLabel)
        addChild(divideLine)
     }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setRandomValue() {
        mFraction = Fraction.random(100);
        update()
    }

    func update() {
        nLabel.text = String(mFraction.n);
        dLabel.text = String(mFraction.d);
    }

    class func label(name: String, n: Int, x: Int, y: Int) -> SKLabelNode
    {
        let label = SKLabelNode(fontNamed:"Optima-Bold")
        label.horizontalAlignmentMode =  SKLabelHorizontalAlignmentMode.Center
        label.name = name
        label.text = String(n)
        label.fontSize = 64
        label.position = CGPoint(x:x, y: y)
        return label
    }

}