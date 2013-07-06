//
//  NSKitSinglyLinkedList.h
//  NSKit
//
//  Created by Patrick on 6/25/13.
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

#import "NSKitLinkedListProtocol.h"


/**
 * Each element of an instance of a data object is represented as a group of memory locations called cell or node.
 * The elements may be stored in any arbitrary set of memory locations.
 * Each element keeps explicit information about the location of the next element through a pointer (or link).
 * Also is called Chain.
*/
@interface NSKitSinglyLinkedList : NSObject
{
    NSObject<NSKitLinkedListProtocol> *first;
}


/**
 * Inserts a new object at the end of the chain.
 *
 * @param object The object to be added at the end of the chain.
 *
 * @returns YES if the object was successfully added, otherwise NO.
 *
 */
- (BOOL)insertObject:(id<NSKitLinkedListProtocol>)object;


/**
 * Inserts a new object at a specific index.
 *
 * @param object The object to be added at a specific index.
 * @param index The specific index.
 *
 * @returns YES if the object was successfully added, otherwise NO.
 *
 */
- (BOOL)insertObject:(id <NSKitLinkedListProtocol>)object
             atIndex:(NSInteger)index;


/**
 * Returns an object at a specific index.
 *
 * @param index The specific index.
 *
 * @returns id If there is an object at this index is returned, otherwise nil.
 *
 */
- (id)objectAtIndex:(NSInteger)index;


/**
 * Deletes the object at a specific index.
 *
 * @param index The index of the object to be removed
 *
 * @returns id The object that was removed on that index, 
 * if nothing was removed nil is returned
 *
 */
- (id)deleObjectAtIndex:(NSInteger)index;


/**
 * Deletes the object that is equat to.
 *
 * @param object The object to be removed
 *
 * @returns id The object that was removed,
 * if nothing was removed nil is returned
 *
 */
- (id)deleObject:(id <NSKitLinkedListProtocol>)object;


/**
 * Returns an index for a specific object.
 *
 * @param object The specific object.
 *
 * @returns NSInteger If there such object the index is returned, otherwise NSNotFound.
 *
 */
- (NSInteger)indexOfObject:(id <NSKitLinkedListProtocol>)object;


/**
 * Checks if the chain is empty.
 *
 * @returns BOOL, YES if the chain is empty, otherwise NO.
 *
 */
- (BOOL)isEmpty;


/**
 * Returns the count of the chain.
 *
 * @returns NSInteger The number of items in the list.
 *
 */
- (NSUInteger)count;


@end
