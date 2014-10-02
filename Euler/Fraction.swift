//
//  Fraction.swift
//  Euler
//
//  Created by Patrick Naughton on 6/10/14.
//  Copyright (c) 2014 Orange Banana. All rights reserved.
//

import Foundation


public func randomInt(min: Int, max:Int) -> Int {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

public class Fraction {
    dynamic var n: Int
    dynamic var d: Int

    public init(n:Int, d:Int) {
        self.n = n
        self.d = d
    }

    public var description: String {
        return isImproper ? (mixedPart > 0 ? "\(wholePart) \(mixedPart)/\(d)" : "\(wholePart)") : (d == 1 ? "\(n)" : "\(n)/\(d)")
    }

    public var value: Double {
        get { return Double(n) / Double(d) }
    }

    public var isImproper: Bool {
        get { return n >= d }
    }

    public var wholePart: Int {
        get { return n / d }
    }

    public var mixedPart: Int {
        get { return n % d }
    }

    public func inverse() -> Fraction {
        return Fraction(n: d, d: n)
    }
}

public func gcd(var u: Int, var v: Int) -> Int {
    if u == 0 {return v}
    if v == 0 {return u}
    if u < 0 {u = -u}
    if v < 0 {v = -v}
    var shift = 0
    while ((u | v) & 1) == 0 {
        u >>= 1
        v >>= 1
        ++shift
    }
    while (u & 1) == 0 {
        u >>= 1;
    }
    do {
        while (v & 1) == 0 {
            v >>= 1
        }
        if u > v {
            let t = v
            v = u
            u = t
        }
        v -= u
    } while v != 0
    return u << shift
}

public func == (left: Fraction, right: Fraction) -> Bool {
    return left.n == right.n && left.d == right.d
}

public func != (left: Fraction, right: Fraction) -> Bool {
    return left.n != right.n || left.d != right.d
}

public func * (left: Fraction, right: Fraction) -> Fraction {
    var n = left.n * right.n
    var d = left.d * right.d
    let g = gcd(n, d)
    n /= g
    d /= g
    return Fraction(n: n, d: d)
}

public func * (left: Int, right: Fraction) -> Fraction {
    return Fraction(n: left, d: 1) * right
}

public func * (left: Fraction, right: Int) -> Fraction {
    return left * Fraction(n: right, d: 1)
}

public func / (left: Fraction, right: Fraction) -> Fraction {
    var n = left.n * right.d
    var d = left.d * right.n
    let g = gcd(n, d)
    n /= g
    d /= g
    return Fraction(n: n, d: d)
}

public func / (left: Int, right: Fraction) -> Fraction {
    return Fraction(n: left, d: 1) / right
}

public func / (left: Fraction, right: Int) -> Fraction {
    return left / Fraction(n: right, d: 1)
}

public func + (left: Fraction, right: Fraction) -> Fraction {
    var n = left.n * right.d + right.n * left.d
    var d = left.d * right.d
    let g = gcd(n, d)
    n /= g
    d /= g
    return Fraction(n: n, d: d)
}

public func + (left: Int, right: Fraction) -> Fraction {
    return Fraction(n: left, d: 1) + right
}

public func + (left: Fraction, right: Int) -> Fraction {
    return left + Fraction(n: right, d: 1)
}

public func - (left: Fraction, right: Fraction) -> Fraction {
    var n = left.n * right.d - right.n * left.d
    var d = left.d * right.d
    let g = gcd(n, d)
    n /= g
    d /= g
    return Fraction(n: n, d: d)
}

public func - (left: Int, right: Fraction) -> Fraction {
    return Fraction(n: left, d: 1) - right
}

public func - (left: Fraction, right: Int) -> Fraction {
    return left - Fraction(n: right, d: 1)
}
