//
//  NSKitDoubleLinkedList_Test.m
//  NSKit
//
//  Created by Patrick Chamelo on 7/6/13.
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

#import "NSKitDoubleLinkedList.h"
#import "NSKitNode.h"


// ------------------------------------------------------------------------------------------


@interface NSKitDoubleLinkedList_Test : XCTestCase

@end


// ------------------------------------------------------------------------------------------


@implementation NSKitDoubleLinkedList_Test


// ------------------------------------------------------------------------------------------
#pragma mark - Tests
// ------------------------------------------------------------------------------------------
- (void)testInsert
{
    NSKitDoubleLinkedList *linkedList = [[NSKitDoubleLinkedList alloc] init];
    NSKitNode *node1 = [[NSKitNode alloc] init];
    NSKitNode *node2 = [[NSKitNode alloc] init];
    NSKitNode *node3 = [[NSKitNode alloc] init];
    NSKitNode *node4 = [[NSKitNode alloc] init];
    NSKitNode *node5 = [[NSKitNode alloc] init];
    NSKitNode *node6 = [[NSKitNode alloc] init];
    
    int random = arc4random() % 3;
    int count = 0;
    
    count += [linkedList insertObject:node1];
    count += [linkedList insertObject:node2 atIndex:1];
    
    XCTAssertTrue(node1.nextLink == node2, @"Next is broken");
    XCTAssertTrue(node1.previousLink == nil, @"Previous is broken");

    XCTAssertTrue(node2.nextLink == nil, @"Next is broken");
    XCTAssertTrue(node2.previousLink == node1, @"Previous is broken");

    
    count += [linkedList insertObject:node3];
    count += [linkedList insertObject:node4 atIndex:0];
    
    XCTAssertTrue(node1.previousLink == node4, @"Previous is broken");
    XCTAssertTrue(node4.nextLink == node1, @"Next is broken");
    XCTAssertTrue(node2.previousLink == node1, @"Previous is broken");
    XCTAssertTrue(node1.nextLink == node2, @"Next is broken");

    count += [linkedList insertObject:node5 atIndex:random];
    count += [linkedList insertObject:node6 atIndex:random];
    
    XCTAssertTrue(linkedList.count == count, @"Count is not the same");
    
    NSInteger previousCount = linkedList.count;
    if ([linkedList deleObjectAtIndex:random])
    {
        XCTAssertTrue(linkedList.count == previousCount - 1, @"Count is not the same");
    }
    else
    {
        XCTAssertTrue(linkedList.count == previousCount, @"Count is not the same");
    }
    
    previousCount = linkedList.count;
    random = arc4random() % 3;
    if ([linkedList deleObjectAtIndex:random])
    {
        XCTAssertTrue(linkedList.count == previousCount - 1, @"Count is not the same");
    }
    else
    {
        XCTAssertTrue(linkedList.count == previousCount, @"Count is not the same");
    }
    
    previousCount = linkedList.count;
    random = arc4random() % 3;
    if ([linkedList deleObjectAtIndex:random])
    {
        XCTAssertTrue(linkedList.count == previousCount - 1, @"Count is not the same");
    }
    else
    {
        XCTAssertTrue(linkedList.count == previousCount, @"Count is not the same");
    }
    
    previousCount = linkedList.count;
    random = arc4random() % 3;
    if ([linkedList deleObject:node2])
    {
        XCTAssertTrue(linkedList.count == previousCount - 1, @"Count is not the same");
    }
    else
    {
        XCTAssertTrue(linkedList.count == previousCount, @"Count is not the same");
    }
    
    BOOL isEmpty = linkedList.isEmpty;
    
    if (isEmpty)
    {
        XCTAssertTrue(linkedList.count == 0, @"Count is not the same");
    }
    else
    {
        XCTAssertFalse(linkedList.count == 0, @"Count is not the same");
    }
}


@end
