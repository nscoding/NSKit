//
//  NSKitMath_Test.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/28/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSKitMath.h"


// ------------------------------------------------------------------------------------------


@interface NSKitMath_Test : XCTestCase @end


// ------------------------------------------------------------------------------------------

@implementation NSKitMath_Test

// ------------------------------------------------------------------------------------------
#pragma mark - Tests
// ------------------------------------------------------------------------------------------
- (void)testHasDecimals
{
    XCTAssertTrue([NSKitMath hasDecimalPoints:4.44], @"Issue found with decimal points");
    XCTAssertTrue([NSKitMath hasDecimalPoints:1.001], @"Issue found with decimal points");
    XCTAssertFalse([NSKitMath hasDecimalPoints:5], @"Issue found with decimal points");
}


- (void)testGenerateRandom
{
    NSInteger random = [NSKitMath generateRandomFromNumber:10 toNumber:20];
    XCTAssertTrue((random >= 10 && random <= 20), @"Issue found random generation");

    random = [NSKitMath generateRandomFromNumber:5 toNumber:5];
    XCTAssertTrue((random == 5), @"Issue found random generation");

    XCTAssertTrueNoThrow([NSKitMath generateRandomFromNumber:6 toNumber:5], @"Should throw exception");
}


@end
