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



- (NSString *)description
{
    NSKitNode *node = first;
    NSInteger count = 0;
    
    if (self.count == 0)
    {
        return @"Linked list is empty";
    }
    
    NSMutableString *log = [[NSMutableString alloc] init];
    [log appendString:@"-------------"];
    
    while (node)
    {
        if (node)
        {
            [log appendString:[node description]];
            count++;
        }
        
        node = node.next;
    }
    
    [log appendString:@"-------------"];
    
    return log;
}


- (BOOL)insertObject:(id)object
{
    return [self insertObject:object
                      atIndex:self.count];
}


- (BOOL)insertObject:(id)object
             atIndex:(NSInteger)index
{
    if (object == nil)
    {
        return NO;
    }
    
    if (index == 0 && first == nil)
    {
        first = object;
        
        return YES;
    }

    NSKitNode *previousNode = [self objectAtIndex:index - 1];
    if (previousNode)
    {
        NSKitNode *currentNext = previousNode.next;
        previousNode.next = object;
        ((NSKitNode *)object).next = currentNext;
        
        return YES;
    }
    
    NSKitNode *currentNode = [self objectAtIndex:index];
    if (currentNode && currentNode == first)
    {
        NSKitNode *current = first;
        first = object;
        ((NSKitNode *)object).next = current;
        return YES;
    }

    return NO;
}


- (id)objectAtIndex:(NSInteger)index
{
    NSKitNode *objectToReturn = first;
    NSInteger count = 0;
    
    while (objectToReturn)
    {
        if (count == index)
        {
            return objectToReturn;
        }
        
        count++;
        objectToReturn = objectToReturn.next;
    }
    
    return nil;
}


- (id)deleObjectAtIndex:(NSInteger)index
{
    NSKitNode *nodeToDelete = [self objectAtIndex:index];
    NSKitNode *previousNode = [self objectAtIndex:index - 1];
    previousNode.next = nodeToDelete.next;
    
    if (index == 0)
    {
        first = nodeToDelete.next;
    }
    
    return nodeToDelete;
}


- (id)deleObject:(id)object
{
    NSInteger index = [self indexOfObject:object];

    if (index != NSNotFound)
    {
        return [self deleObjectAtIndex:index];
    }
    
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
    return (first == nil);
}


- (NSUInteger)count
{
    if (first == nil)
    {
        return 0;
    }
    
    NSKitNode *node = first;
    NSUInteger count = 0;
    
    while (node)
    {
        count++;
        node = node.next;
    }
    
    return count;
}


@end
