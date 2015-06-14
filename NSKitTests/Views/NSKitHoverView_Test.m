//
//  NSKitHoverView_Test.m
//  NSKit
//
//  Created by Patrick Chamelo on 18/05/14.
//  Copyright (c) 2015 Patrick Chamelo. All rights reserved.
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


#import <XCTest/XCTest.h>

#import "NSKitHoverView.h"


// ------------------------------------------------------------------------------------------


@interface NSKitHoverView_Test : XCTestCase

@property (nonatomic, strong) NSKitHoverView *hoverView;
@property (nonatomic, assign) BOOL worked;

@end


// ------------------------------------------------------------------------------------------



@implementation NSKitHoverView_Test


// ------------------------------------------------------------------------------------------
#pragma mark - Setup
// ------------------------------------------------------------------------------------------
- (void)setUp
{
    [super setUp];

    self.hoverView = [[NSKitHoverView alloc] init];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Tear Down
// ------------------------------------------------------------------------------------------
- (void)tearDown
{
    [super tearDown];
    
    self.hoverView = nil;
    XCTAssertTrue((self.hoverView == nil), @"Hover view is not released properly.");
}


// ------------------------------------------------------------------------------------------
#pragma mark - Tests
// ------------------------------------------------------------------------------------------
- (void)testHoverView
{
    XCTAssertTrue((self.hoverView.action == nil), @"Target should be nil");
    XCTAssertTrue((self.hoverView.target == nil), @"Target should be nil.");
    XCTAssertTrue(([self.hoverView isEnabled]), @"Control should be enabled.");

    self.hoverView.action = @selector(invokeMethodWithoutArgument);
    self.hoverView.target = self;
    self.hoverView.enabled = NO;
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    [self.hoverView performSelector:@selector(fireAction) withObject:nil];
    
    XCTAssertTrue((self.worked), @"Method with no argument was not invoked correctly.");
    XCTAssertTrue((self.hoverView.action != nil), @"Target should not be nil");
    XCTAssertTrue((self.hoverView.target != nil), @"Target should not be nil.");
    XCTAssertTrue(([self.hoverView isEnabled] == NO), @"Control should be disabled.");
    
    self.worked = NO;
    
    self.hoverView.action = @selector(invokeMethodWithArgument:);
    self.hoverView.target = self;
    self.hoverView.enabled = NO;

    [self.hoverView performSelector:@selector(fireAction) withObject:nil];

    self.hoverView.action = @selector(invokeMethodWithArgument:andArgument:);
    XCTAssertThrows([self.hoverView performSelector:@selector(fireAction) withObject:nil], @"An exception should be thrown.");

#pragma clang diagnostic pop
#pragma pop
}


// ------------------------------------------------------------------------------------------
#pragma mark - Helper methods
// ------------------------------------------------------------------------------------------
- (void)invokeMethodWithoutArgument
{
    self.worked = YES;
}


- (void)invokeMethodWithArgument:(NSKitHoverView *)hoverView
{
    XCTAssertTrue(([self.hoverView isEqualTo:hoverView]), @"Method argument was wrong.");
    self.worked = YES;
}


@end
