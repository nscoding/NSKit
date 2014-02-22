//
//  NSKitLRUCache.h
//  NSKit
//
//  Created by Patrick Chamelo on 22/02/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//


@class NSKitLRUCache;

@protocol NSKitLRUCacheDelegate <NSObject>

@optional
- (void)leastRecentlyUsedCache:(NSKitLRUCache *)cache willEvictObject:(id)obj;

@end


// ------------------------------------------------------------------------------------------


@interface NSKitLRUCache : NSObject

/**
 * The maximum number of objects that the cache can currently hold.
 */
@property (nonatomic, assign, readwrite) NSUInteger countLimit;


/**
 * The delegate of the NSKitLRUCache.
 */
@property (nonatomic, unsafe_unretained) id<NSKitLRUCacheDelegate> delegate;


/**
 * Initializes the cache with a given limit.
 */
- (id)initWithCountLimit:(NSUInteger)limit;


/**
 * Returns the value associated with a given key.
 */
- (id)objectForKey:(id)key;


/**
 * Sets the value of the specified key in the cache.
 */
- (void)setObject:(id)obj forKey:(id)key;


/**
 * Removes the value of the specified key in the cache.
 */
- (void)removeObjectForKey:(id)key;


@end



