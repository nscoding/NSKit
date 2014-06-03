//
//  NSKitMath_Test.swift
//  NSKit
//
//  Created by Patrick Chamelo on 02/06/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//

import XCTest

class NSKitMath_Test: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testHasDecimals() {
        // This is an example of a functional test case.
        var random = NSKitMath.hasDecimalPoints(4.44)
        XCTAssertTrue(random, "Issue found with decimal points")
        
        random = NSKitMath.hasDecimalPoints(1.001)
        XCTAssertTrue(random, "Issue found with decimal points")
        
        random = NSKitMath.hasDecimalPoints(5)
        XCTAssertFalse(random, "Issue found with decimal points")
    }

    func testGenerateRandom() {
        // This is an example of a functional test case.
        var random = NSKitMath.generateRandomFromNumber(10, toNumber: 20)
        XCTAssertTrue((random >= 10 && random <= 20), "Issue found random generation")
        
        random = NSKitMath.generateRandomFromNumber(5, toNumber: 5)
        XCTAssertTrue((random == 5), "Issue found random generation")

        // FIXME: How to assert NSException?
        // random = NSKitMath.generateRandomFromNumber(6, toNumber: 5)
    }
}
