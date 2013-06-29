//
//  NSKitHeapPriorityQueue_Test.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/30/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSKitHeapPriorityQueue.h"


// ------------------------------------------------------------------------------------------


@interface NSKitPriorityNode : NSObject <NSKitHeapPriorityQueueComparator>

@property (nonatomic, assign) NSInteger priority;

- (id)initWithPriority:(NSInteger)pr;

@end


@implementation NSKitPriorityNode

- (id)initWithPriority:(NSInteger)pr
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
    
    NSLog(@"%@", priorityQueue.description);
    
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
