//
//  NSKitQueue_Test.m
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
#import "NSKitQueue.h"


// ------------------------------------------------------------------------------------------


@interface NSKitQueue_Test : XCTestCase @end


// ------------------------------------------------------------------------------------------


@implementation NSKitQueue_Test

// ------------------------------------------------------------------------------------------
#pragma mark - Tests
// ------------------------------------------------------------------------------------------
- (void)testQueue
{
    NSKitQueue *queue = [[NSKitQueue alloc] init];
    NSNumber *node1 = @(1);
    NSNumber *node2 = @(2);
    NSNumber *node3 = @(3);

    [queue add:node1];
    XCTAssertTrue(queue.count == 1, @"Count is not the same");

    [queue add:node2];
    XCTAssertTrue(queue.count == 2, @"Count is not the same");

    [queue add:node3];
    XCTAssertTrue(queue.count == 3, @"Count is not the same");

    XCTAssertTrue(queue.isEmpty == NO, @"Queue is not empty");

    XCTAssertTrue([queue first] == node1, @"Node is wrong");
    XCTAssertTrue([queue last] == node3, @"Node is wrong");
    
    [queue remove];
    XCTAssertTrue([queue first] == node2, @"Node is wrong");

    [queue remove];
    XCTAssertTrue([queue first] == node3, @"Node is wrong");

    [queue remove];
    XCTAssertTrue(queue.isEmpty == YES, @"Queue is not empty");
}


@end
