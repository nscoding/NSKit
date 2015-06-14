//
//  NSKitLRUCache.m
//  NSKit
//
//  Created by Patrick Chamelo on 22/02/14.
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

#import "NSKitLRUCache.h"
#import "NSKitCacheEntry.h"

@implementation NSKitLRUCache
{
    NSMutableDictionary *_entries;
    NSMutableArray *_entriesOrderedByLRU;
    struct {
        unsigned int willEvictObject;
    } delegateFlags;
}

#pragma mark - Initializers

- (instancetype)init
{
    return [self initWithCountLimit:0];
}

- (instancetype)initWithCountLimit:(NSUInteger)limit
{
    if (self = [super init]) {
        _entries = [[NSMutableDictionary alloc] init];
        _entriesOrderedByLRU = [[NSMutableArray alloc] init];
        _countLimit = limit;
    }
    return self;
}

#pragma mark - Public API

- (id)objectForKey:(id)key
{
    NSAssert((key != nil), @"Key cannot be nil.");
    // Look for the cache entry with the given key
    NSKitCacheEntry *entry = [_entries objectForKey:key];
    if (entry == nil) {
        return nil;
    }
    // Refresh the entry by moving it to the end of the LRU list
    [_entriesOrderedByLRU removeObjectIdenticalTo:entry];
    [_entriesOrderedByLRU addObject:entry];
    return [entry object];
}

- (void)setObject:(id)obj forKey:(id)key
{
    NSAssert((key != nil), @"Key cannot be nil.");
    if (obj == nil) {
        return;
    }
    NSKitCacheEntry *entry = [_entries objectForKey:key];
    if (entry) {
        [_entriesOrderedByLRU removeObjectIdenticalTo:entry];
    }

    entry = [[NSKitCacheEntry alloc] initWithObject:obj forKey:key];
    [_entries setObject:entry forKey:key];
    [_entriesOrderedByLRU addObject:entry];
    [self enforceCountLimit];
}

- (void)removeObjectForKey:(id)key
{
    NSKitCacheEntry *entry = [_entries objectForKey:key];
    if (entry) {
        [_entries removeObjectForKey:key];
        [_entriesOrderedByLRU removeObjectIdenticalTo:entry];
    }
}

- (void)enforceCountLimit
{
    NSUInteger count = [_entriesOrderedByLRU count];
    while (count > _countLimit) {
        NSKitCacheEntry *enrtyToEvict = [_entriesOrderedByLRU nskit_firstObject];
        [_entries removeObjectForKey:enrtyToEvict.key];
        [_entriesOrderedByLRU removeObjectIdenticalTo:enrtyToEvict];
        if (_delegate && delegateFlags.willEvictObject)
        {
            [_delegate leastRecentlyUsedCache:self willEvictObject:enrtyToEvict.object];
        }
        count = [_entriesOrderedByLRU count];
    }
}

#pragma mark - Keyed Subscripting

- (id)objectForKeyedSubscript:(id)key
{
    return [self objectForKey:key];
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key
{
    [self setObject:obj forKey:key];
}

#pragma mark - Overrides

- (void)setDelegate:(id<NSKitLRUCacheDelegate>)delegate
{
    _delegate = delegate;
    delegateFlags.willEvictObject = [_delegate respondsToSelector:@selector(leastRecentlyUsedCache:willEvictObject:)];
}

- (void)setCountLimit:(NSUInteger)countLimit
{
    _countLimit = countLimit;
    [self enforceCountLimit];
}

#pragma mark - Dealloc

- (void)dealloc
{
    _delegate = nil;
}

@end
