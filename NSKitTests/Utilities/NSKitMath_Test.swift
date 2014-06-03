//
//  NSKitMath_Test.swift
//  NSKit
//
//  Created by Patrick Chamelo on 02/06/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import XCTest

class NSKitMath_Test: XCTestCase
{
    func testHasDecimals()
    {
        var random = NSKitMath.hasDecimalPoints(4.44)
        XCTAssertTrue(random, "Issue found with decimal points")
        
        random = NSKitMath.hasDecimalPoints(1.001)
        XCTAssertTrue(random, "Issue found with decimal points")
        
        random = NSKitMath.hasDecimalPoints(5)
        XCTAssertFalse(random, "Issue found with decimal points")
    }

    func testGenerateRandom()
    {
        var random = NSKitMath.generateRandomFromNumber(10, toNumber: 20)
        XCTAssertTrue((random >= 10 && random <= 20),
            "Number was expected to be between 10 to 20")

        random = NSKitMath.generateRandomFromNumber(5, toNumber: 100)
        XCTAssertTrue((random >= 5 && random <= 100),
            "Number was expected to be between 5 to 100")

        random = NSKitMath.generateRandomFromNumber(5, toNumber: 5)
        XCTAssertTrue((random == 5), "Number was expected to be 5")

        // FIXME
        // random = NSKitMath.generateRandomFromNumber(6, toNumber: 5)
        // XCTAssertTrue((random == Int.max), "Should throw an exception and return MAX")
    }
}
