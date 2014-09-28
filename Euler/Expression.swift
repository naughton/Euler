//
//  Expression.swift
//  Euler
//
//  Created by Patrick Naughton on 9/26/14.
//  Copyright (c) 2014 Orange Banana. All rights reserved.
//

public enum Op: Character {
    case plus = "+"
    case minus = "−"
    case times = "×"
    case divide = "÷"
}

public class Expression {
    var left: Fraction
    var right: Fraction
    var op: Op

    public init(left: Fraction, op: Op, right: Fraction) {
        self.left = left
        self.op = op
        self.right = right
    }

    public var value: Fraction {
        get {
            switch (op) {
            case .plus:
                return left + right
            case .minus:
                return left - right
            case .times:
                return left * right
            case .divide:
                return left / right
            }
        }
    }
}