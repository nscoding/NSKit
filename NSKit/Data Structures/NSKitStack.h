//
//  NSKitStack.h
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


/** A stack is a linear list in which insertions (also called additions) and deletions take place at the same end. This end is called the top. The other end is called the bottom. 
 
 - Stack is a specialized or restricted version of a more general data object linear list.
 - Every instance of the data object stack is also an instance of the data object linear list. Moreover, all stack operations can be performed as linear list operations.
 - This specialized version of the stack is created by extending the NSMutableArray.
 */
@interface NSKitStack : NSObject

/**
 * Add an element to the stack.
 *
 * @param objToPush the object to be added to the stack.
 */
- (void)push:(id)objToPush;

/**
 * Delete top element from stack.
 *
 * @returns id The poped object, nil if the stack is empty.
 *
 */
- (id)pop;

/**
 * Returns top element from stack.
 *
 * @returns id The top object in the stack, nil if the stack is empty.
 *
 */
- (id)top;

/**
 * Checks if the stack is empty.
 *
 * @returns BOOL YES if is empty, otherwise NO.
 *
 */
- (BOOL)isEmpty;

/**
 * The number of objects in the stack.
 *
 * @returns Returns the number of objects currently in the stack.
 *
 */
- (NSUInteger)count;

@end
