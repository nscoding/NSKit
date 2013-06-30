//
//  NSKitStack_Test.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/27/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
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
#import "NSKitStack.h"


// ------------------------------------------------------------------------------------------


@interface NSKitStack_Test : XCTestCase @end


// ------------------------------------------------------------------------------------------


@implementation NSKitStack_Test

// ------------------------------------------------------------------------------------------
#pragma mark - Tests
// ------------------------------------------------------------------------------------------
- (void)testStack
{
    NSKitStack *stack = [[NSKitStack alloc] init];
    NSNumber *node1 = [NSNumber numberWithInteger:1];
    NSNumber *node2 = [NSNumber numberWithInteger:2];
    NSNumber *node3 = [NSNumber numberWithInteger:3];

    [stack push:node1];
    XCTAssertTrue(stack.count == 1, @"Count is not the same");

    [stack push:node2];
    XCTAssertTrue(stack.count == 2, @"Count is not the same");

    [stack push:node3];
    XCTAssertTrue(stack.count == 3, @"Count is not the same");

    XCTAssertTrue(stack.isEmpty == NO, @"Stack is not empty");

    XCTAssertTrue([stack pop] == node3, @"Node is wrong");
    XCTAssertTrue([stack pop] == node2, @"Node is wrong");
    XCTAssertTrue([stack pop] == node1, @"Node is wrong");
    
    XCTAssertTrue(stack.isEmpty == YES, @"Stack is not empty");
}


@end
