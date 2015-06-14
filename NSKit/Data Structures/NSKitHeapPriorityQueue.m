//
//  NSKitHeapPriorityQueue.m
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


#import "NSKitHeapPriorityQueue.h"

#pragma mark - Callbacks

static const void *NSKitPriorityObjectRetain(CFAllocatorRef allocator, const void *ptr)
{
    return CFBridgingRetain((__bridge id)(ptr));
}

static void NSKitPriorityObjectRelease(CFAllocatorRef allocator, const void *ptr)
{
    CFBridgingRelease(ptr);
}

static CFStringRef NSKitPriorityObjectCopyDescription(const void* ptr)
{
    NSObject *event = (__bridge NSObject *) ptr;
    CFStringRef desc = (__bridge CFStringRef) [event description];
    return desc;
}

static CFComparisonResult NSKitPriorityObjectCompare(const void *ptr1, const void *ptr2, void *context)
{
    NSObject *item1 = (__bridge NSObject *)ptr1;
    NSObject *item2 = (__bridge NSObject *)ptr2;
    id<NSKitHeapPriorityQueueComparator> comparator = (__bridge id<NSKitHeapPriorityQueueComparator>)ptr1;
    return (CFComparisonResult)[comparator compare:item1 to:item2];
}

@implementation NSKitHeapPriorityQueue
{
    CFBinaryHeapRef _heap;
}

#pragma mark - Initialize

- (instancetype)init
{
    if (self = [super init]) {
        CFBinaryHeapCallBacks callbacks;
        callbacks.version = 0;
        
        // Callbacks to the functions above
        callbacks.retain = NSKitPriorityObjectRetain;
        callbacks.release = NSKitPriorityObjectRelease;
        callbacks.copyDescription = NSKitPriorityObjectCopyDescription;
        callbacks.compare = NSKitPriorityObjectCompare;
        CFBinaryHeapCompareContext compareContext;
        compareContext.version = 0;
        NSUInteger capacity = 0;
        _heap = CFBinaryHeapCreate(kCFAllocatorDefault, capacity, &callbacks, &compareContext);
    }
    return self;
}

#pragma mark - Methods

- (NSString *)description
{
    return [NSString stringWithFormat:@"Priority Queue: {%@}", (_heap ? [[self allObjects] description] : @"nil")];
}

- (NSUInteger)count
{
    return CFBinaryHeapGetCount(_heap);
}

- (NSArray *)allObjects
{
    const void **arrayC = calloc(CFBinaryHeapGetCount(_heap), sizeof(void *));
    CFBinaryHeapGetValues(_heap, arrayC);
    NSArray *array = [NSArray arrayWithObjects:(__unsafe_unretained id *)(void *)arrayC count:CFBinaryHeapGetCount(_heap)];
    free(arrayC);
    return array;
}

- (void)addObject:(NSObject *)object
{
    CFBinaryHeapAddValue(_heap, (__bridge const void *)(object));
}

- (void)removeAllObjects
{
    CFBinaryHeapRemoveAllValues(_heap);
}

- (NSObject *)nextObject
{
    NSObject *obj = [self peekObject];
    CFBinaryHeapRemoveMinimumValue(_heap);
    return obj;
}

- (NSObject *)peekObject
{
    return (NSObject *)CFBinaryHeapGetMinimum(_heap);
}

#pragma mark - Dealloc

- (void)dealloc
{
    CFRelease(_heap);
}

@end

