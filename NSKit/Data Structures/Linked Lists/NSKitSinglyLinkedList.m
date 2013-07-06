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


// ------------------------------------------------------------------------------------------


@implementation NSKitSinglyLinkedList


// ------------------------------------------------------------------------------------------
#pragma mark - Methods
// ------------------------------------------------------------------------------------------
- (NSString *)description
{
    NSObject<NSKitLinkedListProtocol> *node = first;
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
            [log appendString:@" - "];
            [log appendString:node.description];
            [log appendString:@" - "];
            
            count++;
        }
        
        node = node.nextLink;
    }
    
    [log appendString:@"-------------"];
    
    return log;
}


- (BOOL)insertObject:(id <NSKitLinkedListProtocol>)object
{
    return [self insertObject:object
                      atIndex:self.count];
}


- (BOOL)insertObject:(id <NSKitLinkedListProtocol>)object
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
    
    NSObject<NSKitLinkedListProtocol> *previousNode = nil;
    NSObject<NSKitLinkedListProtocol> *currentNode = nil;
    
    [self previousObject:&previousNode
           currentObject:&currentNode
                 atIndex:index];

    if (previousNode)
    {
        NSObject<NSKitLinkedListProtocol> *currentNext = previousNode.nextLink;
        previousNode.nextLink = object;
        object.nextLink = currentNext;
        
        return YES;
    }
    
    if (currentNode && currentNode == first)
    {
        NSObject<NSKitLinkedListProtocol> *current = first;
        first = object;
        object.nextLink = current;
        return YES;
    }

    return NO;
}


- (id)objectAtIndex:(NSInteger)index
{
    NSObject<NSKitLinkedListProtocol> *currentNode = nil;
    
    [self previousObject:nil
           currentObject:&currentNode
                 atIndex:index];
    
    return currentNode;
}


- (void)previousObject:(NSObject **)prevObject
         currentObject:(NSObject **)currentObject
               atIndex:(NSInteger)index
{
    NSObject<NSKitLinkedListProtocol> *objectToReturn = first;
    NSInteger count = 0;
    
    while (objectToReturn)
    {
        if (count == index - 1 && prevObject)
        {
            *prevObject = objectToReturn;
        }
        else if (count == index)
        {
            *currentObject = objectToReturn;
            break;
        }
        
        count++;
        objectToReturn = objectToReturn.nextLink;
    }
}


- (id)deleObjectAtIndex:(NSInteger)index
{
    NSObject<NSKitLinkedListProtocol> *previousNode = nil;
    NSObject<NSKitLinkedListProtocol> *nodeToDelete = nil;
    
    [self previousObject:&previousNode
           currentObject:&nodeToDelete
                 atIndex:index];
    
    previousNode.nextLink = nodeToDelete.nextLink;
    
    if (index == 0)
    {
        first = nodeToDelete.nextLink;
    }
    
    return nodeToDelete;
}


- (id)deleObject:(id <NSKitLinkedListProtocol>)object
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
    NSObject<NSKitLinkedListProtocol> *nodeToSet = first;
    NSUInteger count = 0;
    
    while (nodeToSet)
    {
        if ([nodeToSet isEqualTo:object])
        {
            return count;
        }
        
        count++;
        nodeToSet = nodeToSet.nextLink;
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
    
    NSObject<NSKitLinkedListProtocol> *node = first;
    NSUInteger count = 0;
    
    while (node)
    {
        count++;
        node = node.nextLink;
    }
    
    return count;
}


@end
