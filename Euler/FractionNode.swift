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
    var fraction: Fraction
    var proper: Bool

    var nLabel: SKLabelNode
    var divider: SKSpriteNode
    var dLabel: SKLabelNode
    var wLabel: SKLabelNode

    let fontName = "Optima-Bold"
    let fontSize:CGFloat = 120

    let color = UIColor.blackColor()

    init(fraction: Fraction, proper: Bool = false) {

        self.fraction = fraction
        self.proper = proper

        nLabel = SKLabelNode(fontNamed:fontName)
        nLabel.verticalAlignmentMode =  SKLabelVerticalAlignmentMode.Bottom
        nLabel.fontSize = fontSize
        nLabel.fontColor = color

        dLabel = SKLabelNode(fontNamed:fontName)
        dLabel.verticalAlignmentMode =  SKLabelVerticalAlignmentMode.Top
        dLabel.fontSize = fontSize
        dLabel.fontColor = color

        wLabel = SKLabelNode(fontNamed:fontName)
        wLabel.verticalAlignmentMode =  SKLabelVerticalAlignmentMode.Center
        wLabel.fontSize = fontSize * 2
        wLabel.fontColor = color

        divider = SKSpriteNode(color: color, size: CGSize(width: 8, height: 4))

        super.init()

        update()

        name = "fraction"
        addChild(nLabel)
        addChild(dLabel)
        addChild(divider)
        addChild(wLabel)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update() {
        let gap:CGFloat = fontSize/16
        if (proper) {
            if (fraction.mixedPart > 0) {
                nLabel.text = String(fraction.mixedPart)
                dLabel.text = String(fraction.d)
                divider.size.width = max(nLabel.frame.width, dLabel.frame.width)
                var dx: CGFloat
                if (fraction.wholePart > 0) {
                    wLabel.text = String(fraction.wholePart)
                    dx = divider.size.width / 2
                } else {
                    wLabel.text = ""
                    dx = 0
                }
                nLabel.position = CGPoint(x: dx, y: gap)
                dLabel.position = CGPoint(x: dx, y: -gap)
                divider.position.x = dx
                wLabel.position.x = -wLabel.frame.width / 2 - gap
           } else {
                wLabel.text = String(fraction.wholePart)
                nLabel.text = ""
                dLabel.text = ""
                divider.size.width = 0
                wLabel.position.x = 0
            }
        } else {
            wLabel.text = ""
            nLabel.text = String(fraction.n);
            nLabel.position = CGPoint(x:0, y:gap)
            dLabel.text = String(fraction.d);
            dLabel.position = CGPoint(x:0, y:-gap)
            divider.size.width = max(nLabel.frame.width, dLabel.frame.width)
        }
    }

    func setFraction(fraction: Fraction) {
        self.fraction = fraction
        update()
    }
}