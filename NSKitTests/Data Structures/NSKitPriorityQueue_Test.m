//
//  NSKitHeapPriorityQueue_Test.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/30/13.
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
#import "NSKitHeapPriorityQueue.h"


// ------------------------------------------------------------------------------------------


@interface NSKitPriorityNode : NSObject <NSKitHeapPriorityQueueComparator>

@property (nonatomic, assign) NSInteger priority;

- (instancetype)initWithPriority:(NSInteger)pr;

@end


// ------------------------------------------------------------------------------------------


@implementation NSKitPriorityNode


// ------------------------------------------------------------------------------------------
#pragma mark - Tests
// ------------------------------------------------------------------------------------------
- (instancetype)initWithPriority:(NSInteger)pr
{
    if ((self = [super init]))
    {
        self.priority = pr;
    }
    
    return self;
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"--- %lu ---",self.priority];
}


- (NSComparisonResult)compare:(id)obj1 to:(id)obj2
{
    NSKitPriorityNode *node1 = (NSKitPriorityNode *)obj1;
    NSKitPriorityNode *node2 = (NSKitPriorityNode *)obj2;
    
    if (node1.priority <= node2.priority)
    {
        return NSOrderedAscending;
        
    }
    
    return NSOrderedDescending;
}


@end


// ------------------------------------------------------------------------------------------


@interface NSKitHeapPriorityQueue_Test : XCTestCase @end


// ------------------------------------------------------------------------------------------


@implementation NSKitHeapPriorityQueue_Test


- (void)testPriorityQueue
{
    NSKitHeapPriorityQueue *priorityQueue = [[NSKitHeapPriorityQueue alloc] init];
    
    NSKitPriorityNode *node1 = [[NSKitPriorityNode alloc] initWithPriority:0];
    NSKitPriorityNode *node2 = [[NSKitPriorityNode alloc] initWithPriority:1];
    NSKitPriorityNode *node3 = [[NSKitPriorityNode alloc] initWithPriority:2];
    NSKitPriorityNode *node4 = [[NSKitPriorityNode alloc] initWithPriority:3];

    [priorityQueue addObject:node4];
    [priorityQueue addObject:node2];
    [priorityQueue addObject:node3];
    [priorityQueue addObject:node1];
        
    XCTAssertTrue(priorityQueue.count == 4, @"Count should be equal");
    XCTAssertTrue(priorityQueue.nextObject == node1, @"Node is wrong");
    XCTAssertTrue(priorityQueue.count == 3, @"Count should be equal");
    XCTAssertTrue(priorityQueue.peekObject == node2, @"Node is wrong");
    XCTAssertTrue(priorityQueue.count == 3, @"Count should be equal");

    [priorityQueue removeAllObjects];
    XCTAssertTrue(priorityQueue.count == 0, @"Count should be equal");

    // adjusting the date of node 3
    node3.priority = 6;
    [priorityQueue addObject:node3];
    [priorityQueue addObject:node4];

    XCTAssertTrue(priorityQueue.peekObject == node4, @"Node is wrong");
    XCTAssertTrue(priorityQueue.count == 2, @"Count should be equal");
}


@end
