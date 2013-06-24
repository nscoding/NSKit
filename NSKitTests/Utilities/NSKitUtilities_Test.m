//
//  NSKitUtilities+Test.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/24/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSKitUtilities.h"

@interface NSKitUtilities_Test : XCTestCase

@end


@implementation NSKitUtilities_Test


- (void)testFloor
{
    NSRect previousRect = NSMakeRect(10.5, 5.5, 20.7, 30.2);
    NSRect rect = [NSKitUtilities flooredRect:previousRect];

    XCTAssertTrue(rect.origin.x == floorf(previousRect.origin.x), @"Issue found with origin x");
    XCTAssertTrue(rect.origin.y == floorf(previousRect.origin.y), @"Issue found with origin y");
    XCTAssertTrue(rect.size.width == floorf(previousRect.size.width), @"Issue found with width");
    XCTAssertTrue(rect.size.height == floorf(previousRect.size.height), @"Issue found with height");

    XCTAssertTrue(rect.origin.x == 10, @"Issue found with origin x");
    XCTAssertTrue(rect.origin.y == 5, @"Issue found with origin y");
    XCTAssertTrue(rect.size.width == 20, @"Issue found with width");
    XCTAssertTrue(rect.size.height == 30, @"Issue found with height");
}


- (void)testCeil
{
    NSRect previousRect = NSMakeRect(10.5, 5.5, 20.7, 30.2);
    NSRect rect = [NSKitUtilities ceiledRect:previousRect];
    
    XCTAssertTrue(rect.origin.x == ceilf(previousRect.origin.x), @"Issue found with origin x");
    XCTAssertTrue(rect.origin.y == ceilf(previousRect.origin.y), @"Issue found with origin y");
    XCTAssertTrue(rect.size.width == ceilf(previousRect.size.width), @"Issue found with width");
    XCTAssertTrue(rect.size.height == ceilf(previousRect.size.height), @"Issue found with height");

    XCTAssertTrue(rect.origin.x == 11, @"Issue found with origin x");
    XCTAssertTrue(rect.origin.y == 6, @"Issue found with origin y");
    XCTAssertTrue(rect.size.width == 21, @"Issue found with width");
    XCTAssertTrue(rect.size.height == 31, @"Issue found with height");
}


- (void)testValidEmail
{
    NSString *email1 = @"patrick@nscoding.co.uk";
    NSString *email2 = @"patrick_@nscoding.co.uk";
    NSString *email3 = @"patrick @nscoding.co.uk";
    NSString *email4 = @"patrick@@nscoding.co.uk";
    NSString *email5 = @"_patrick_test@nscoding.co.uk";

    XCTAssertTrue([NSKitUtilities isValidEmail:email1], @"Email is valid but failed the test");
    XCTAssertTrue([NSKitUtilities isValidEmail:email2], @"Email is valid but failed the test");
    XCTAssertFalse([NSKitUtilities isValidEmail:email3], @"Email is not valid but passed the test");
    XCTAssertFalse([NSKitUtilities isValidEmail:email4], @"Email is not valid but passed the test");
    XCTAssertTrue([NSKitUtilities isValidEmail:email5], @"Email is valid but failed the test");
}


@end
