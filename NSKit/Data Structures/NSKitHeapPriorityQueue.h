//
//  NSKitHeapPriorityQueue.h
//  NSKit
//
//  Created by Patrick Chamelo on 6/30/13.
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


@protocol NSKitHeapPriorityQueueComparator;

/**
 * Priority Queue implementation. A priority queue is a queue that's always kept 
 * sorted in a fast CFBinaryHeapRef implementation.
 *
 * - http://developer.apple.com/library/mac/documentation/CoreFoundation/Reference/CFBinaryHeapRef/CFBinaryHeapRef.pdf
 *
 */
@interface NSKitHeapPriorityQueue : NSObject

/**
 * Returns number of items in the queue
 */
- (NSUInteger)count;

/**
 * Returns all (sorted) objects in the queue
 */
- (NSArray *)allObjects;

/**
 * Adds an object to the queue
 * @param object The object to be added to the priority queue
 */
- (void)addObject:(NSObject<NSKitHeapPriorityQueueComparator> *)object;

/**
 * Removes all objects from the queue
 */
- (void)removeAllObjects;

/**
 * Removes the "top-most" (as determined by the callback sort function) object from the queue
 * and returns it
 */
- (NSObject *)nextObject;

/**
 * Returns the "top-most" (as determined by the callback sort function) object from the queue
 * without removing it from the queue
 */
- (NSObject *)peekObject;

@end


/**
 * This protocol ensures that the object that is added in the priority queue 
 * has a comparisson mechanism.
 */
@protocol NSKitHeapPriorityQueueComparator<NSObject>

@required

/** 
 * Returns an NSComparisonResult value that indicates the ordering 
 * between to given objects.
 *
 * @param obj1 The first object for the comparison
 * @param obj2 The second object for the comparison
 *
 * @returns NSComparisonResult constant which is used to indicate the order.
 */
- (NSComparisonResult)compare:(id)obj1 to:(id)obj2;

@end

