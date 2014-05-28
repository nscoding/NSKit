//
//  NSKitLRUCache.m
//  NSKit
//
//  Created by Patrick Chamelo on 22/02/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//

#import "NSKitLRUCache.h"
#import "NSKitCacheEntry.h"


// ------------------------------------------------------------------------------------------


@interface NSKitLRUCache ()

@property (nonatomic, strong) NSMutableDictionary *entries;
@property (nonatomic, strong) NSMutableArray *entriesOrderedByLRU;

@end


// ------------------------------------------------------------------------------------------



@implementation NSKitLRUCache


// ------------------------------------------------------------------------------------------
#pragma mark - Initializers
// ------------------------------------------------------------------------------------------
- (instancetype)init
{
    return [self initWithCountLimit:0];
}


- (instancetype)initWithCountLimit:(NSUInteger)limit
{
    if ((self = [super init]))
    {
        self.entries = [[NSMutableDictionary alloc] init];
        self.entriesOrderedByLRU = [[NSMutableArray alloc] init];
        self.countLimit = limit;
    }
    
    return self;
}


// ------------------------------------------------------------------------------------------
#pragma mark - Public API
// ------------------------------------------------------------------------------------------
- (id)objectForKey:(id)key
{
    NSAssert((key != nil), @"Key cannot be nil.");
    
    // Look for the cache entry with the given key
    NSKitCacheEntry *entry = [self.entries objectForKey:key];
    if (entry == nil)
    {
        return nil;
    }
    
    // Refresh the entry by moving it to the end of the LRU list
    [self.entriesOrderedByLRU removeObjectIdenticalTo:entry];
    [self.entriesOrderedByLRU addObject:entry];
    
    return [entry object];

}


- (void)setObject:(id)obj forKey:(id)key
{
    NSAssert((key != nil), @"Key cannot be nil.");

    if (obj == nil)
    {
        return;
    }
    
    NSKitCacheEntry *entry = [self.entries objectForKey:key];
    if (entry)
    {
        [self.entriesOrderedByLRU removeObjectIdenticalTo:entry];
    }
    
    entry = [[NSKitCacheEntry alloc] initWithObject:obj forKey:key];
    [self.entries setObject:entry forKey:key];
    [self.entriesOrderedByLRU addObject:entry];
    
    [self enforceCountLimit];
}


- (void)removeObjectForKey:(id)key
{
    NSKitCacheEntry *entry = [self.entries objectForKey:key];
    if (entry)
    {
        [self.entries removeObjectForKey:key];
        [self.entriesOrderedByLRU removeObjectIdenticalTo:entry];
    }
}


- (void)enforceCountLimit
{
    NSUInteger count = [self.entriesOrderedByLRU count];
    while (count > self.countLimit)
    {
        NSKitCacheEntry *enrtyToEvict = [self.entriesOrderedByLRU nskit_firstObject];
        [self.entries removeObjectForKey:enrtyToEvict.key];
        [self.entriesOrderedByLRU removeObjectIdenticalTo:enrtyToEvict];
        
        if (self.delegate &&
            [self.delegate respondsToSelector:@selector(leastRecentlyUsedCache:willEvictObject:)])
        {
            [self.delegate leastRecentlyUsedCache:self
                                  willEvictObject:enrtyToEvict.object];
        }
        
        count = [self.entriesOrderedByLRU count];
    }
}


// ------------------------------------------------------------------------------------------
#pragma mark - Keyed Subscripting
// ------------------------------------------------------------------------------------------
- (id)objectForKeyedSubscript:(id)key
{
    return [self objectForKey:key];
}


- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key
{
    [self setObject:obj forKey:key];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Overrides
// ------------------------------------------------------------------------------------------
- (void)setCountLimit:(NSUInteger)countLimit
{
    _countLimit = countLimit;
    [self enforceCountLimit];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Dealloc
// ------------------------------------------------------------------------------------------
- (void)dealloc
{
    self.delegate = nil;
}


@end
