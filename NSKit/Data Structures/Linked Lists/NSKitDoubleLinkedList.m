//
//  NSKitDoubleLinkedList.m
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


#import "NSKitDoubleLinkedList.h"
#import "NSKitSinglyLinkedList+Private.h"



// ------------------------------------------------------------------------------------------


@implementation NSKitDoubleLinkedList


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
 
    if (currentNode)
    {
       previousNode = currentNode.previousLink;
    }
    else
    {
        previousNode = [self objectAtIndex:index - 1];
    }

    if (previousNode)
    {
        NSObject<NSKitLinkedListProtocol> *currentNext = previousNode.nextLink;
        
        previousNode.nextLink = object;
        object.previousLink = previousNode;

        object.nextLink = currentNext;
        currentNext.previousLink = object;
        
        return YES;
    }
    
    if (currentNode && currentNode == first)
    {
        NSObject<NSKitLinkedListProtocol> *current = first;
        first = object;
       
        object.nextLink = current;
        current.previousLink = object;
        
        return YES;
    }
    
    return NO;
}


- (id)deleObjectAtIndex:(NSInteger)index
{
    NSObject<NSKitLinkedListProtocol> *nodeToDelete = [self objectAtIndex:index];
    NSObject<NSKitLinkedListProtocol> *previousNode = nodeToDelete.previousLink;
    NSObject<NSKitLinkedListProtocol> *nextNode = nodeToDelete.nextLink;

    previousNode.nextLink = nextNode;
    nextNode.previousLink = previousNode;

    if (index == 0)
    {
        first = nodeToDelete.nextLink;
    }
    
    return nodeToDelete;
}


@end
