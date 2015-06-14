//
//  NSKitQueue.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/24/13.
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

#import "NSKitQueue.h"
#import "NSMutableArray+NSKitExtensions.h"

@implementation NSKitQueue
{
    NSMutableArray *_backingStore;
}

#pragma mark - Overrides

- (NSMutableArray *)backingStore
{
    if (_backingStore == nil) {
        _backingStore = [NSMutableArray array];
    }
    return _backingStore;
}

#pragma mark - Methods

- (void)add:(id)objectToAdd
{
    if (objectToAdd) {
        [_backingStore addObject:objectToAdd];
    }
}

- (id)remove
{
    if (self.isEmpty) {
        return nil;
    }
    id objToRemove = [_backingStore nskit_firstObject];
    [_backingStore nskit_removeFirstObject];
    return objToRemove;
}

- (id)first
{
    if (self.isEmpty) {
        return nil;
    }
    
    return [_backingStore nskit_firstObject];
}

- (id)last
{
    return [_backingStore lastObject];
}

- (BOOL)isEmpty
{
    return (self.count == 0);
}

- (NSUInteger)count
{
    return _backingStore.count;
}

@end
