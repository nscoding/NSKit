//
//  NSKitQueue.h
//  NSKit
//
//  Created by Patrick Chamelo on 6/24/13.
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



/**
 A queue is a special case of linear list where insertions and deletions take place at different ends.
 - Last: end at which a new element is added.
 - First: end at which an element is deleted.
 
 A basic queue implementation using NSMutableArray
 */
@interface NSKitQueue : NSObject


/**
 * Add an element to the queue.
 *
 * @param objectToAdd The object to be added to the queue.
 *
 */
- (void)add:(id)objectToAdd;


/**
 * Delete the front element of the queue.
 *
 * @returns id The object that was removed from the front, nil if the queue if empty.
 *
 */
- (id)remove;


/**
 * Return the first element of the queue.
 *
 * @returns id The first object in the queue, nil if the queue if empty.
 *
 */
- (id)first;


/**
 * Return the last element of the queue.
 *
 * @returns id The last object in the queue, nil if the queue if empty.
 *
 */
- (id)last;


/**
 * Checks if the queue is empty.
 *
 * @returns BOOL
 * YES if is empty, otherwise NO.
 *
 */
- (BOOL)isEmpty;


/**
 * The number of objects in the queue.
 *
 * @returns Returns the number of objects currently in the queue.
 *
 */
- (NSUInteger)count;


@end
