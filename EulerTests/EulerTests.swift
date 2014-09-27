//
//  EulerTests.swift
//  EulerTests
//
//  Created by Patrick Naughton on 9/25/14.
//  Copyright (c) 2014 Orange Banana. All rights reserved.
//

import XCTest
import Euler

class EulerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
#if UNITTESTS
    func testExpr() {
        let left = Fraction(n:1, d:5)
        let right = Fraction(n:2, d:3)
        let expr = Expression(left:left, op:Op.plus, right:right)
        XCTAssertEqual(expr.value().value(), 1 / 5.0 + 2 / 3.0, "pass")
    }
#endif
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
