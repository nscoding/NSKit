//
//  NSKitSinglyLinkedList.m
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


#import "NSKitSinglyLinkedList.h"
#import "NSKitNode.h"

@interface NSKitSinglyLinkedList()
{
    NSKitNode *first;
}

@end

@implementation NSKitSinglyLinkedList


- (BOOL)insertObject:(id)object
{
    return [self insertObject:object
                      atIndex:self.count];
}


- (BOOL)insertObject:(id)object
             atIndex:(NSInteger)index
{
    NSInteger count = 0;

    if (object)
    {
        if (index < 0 || index > self.count)
        {
            @throw @"Index out of bounds";
        }

        if (index == 0)
        {
            first = object;
            return YES;
        }
        
        NSKitNode *nodeToSet = first;
        while (nodeToSet)
        {
            NSKitNode *nextNode = nodeToSet.next;
            if (nextNode)
            {
                nodeToSet = nextNode;
            }
            
            if (count == index)
            {
                break;
            }
            
            count++;
        }
        
        nodeToSet.next = object;
        
        return YES;
    }
    
    return NO;
}


- (id)deleObjectAtIndex:(NSInteger)index
{
    return nil;
}


- (id)deleObject:(id)object
         atIndex:(NSInteger)index
{
    return nil;
}


- (NSInteger)indexOfObject:(id)object
{
    NSKitNode *nodeToSet = first;
    NSUInteger count = 0;
    
    while (nodeToSet)
    {
        if ([nodeToSet isEqualTo:object])
        {
            return count;
        }
        
        count++;
        nodeToSet = nodeToSet.next;
    }
    
    return NSNotFound;
}


- (BOOL)isEmpty
{
    if (first == nil)
    {
        return YES;
    }
    
    return NO;
}


- (NSInteger)count
{
    if (first == nil)
    {
        return 0;
    }
    
    NSKitNode *node = first;
    NSInteger count = 0;
    
    while (node)
    {
        node = node.next;

        if (node)
        {
            count++;
        }
    }
    
    return count;
}


@end
