//
//  NSArray_Test.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/24/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+NSKitExtensions.h"
#import "NSMutableArray+NSKitExtensions.h"

@interface NSArray_Test : XCTestCase

@end

@implementation NSArray_Test

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}


- (void)testReverseArray
{
    NSArray *array = @[@(1), @(2), @(3), @(4)];
    NSArray *reversedArray = [array reversedArray];
    
    XCTAssertTrue(array.count == reversedArray.count, @"Count is not the same");

    NSUInteger count = array.count;
    for (NSNumber *num in reversedArray)
    {
        XCTAssertTrue([num isEqualTo:[array objectAtIndex:--count]], @"Object at %i index is wrong", count);
    }
}


- (void)testReverseMutableArray
{
    NSMutableArray *reversedArray = [NSMutableArray arrayWithArray:@[@(1), @(2), @(3), @(4)]];
    NSMutableArray *array = [reversedArray copy];
    [reversedArray reverse];
    
    XCTAssertTrue(array.count == reversedArray.count, @"Count is not the same");
    
    NSUInteger count = array.count;
    for (NSNumber *num in reversedArray)
    {
        XCTAssertTrue([num isEqualTo:[array objectAtIndex:--count]], @"Object at %i index is wrong", count);
    }
}


@end
