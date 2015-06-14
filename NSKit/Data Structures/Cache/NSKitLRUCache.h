//
//  NSKitLRUCache.h
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


@class NSKitLRUCache;

@protocol NSKitLRUCacheDelegate <NSObject>

@optional
- (void)leastRecentlyUsedCache:(NSKitLRUCache *)cache willEvictObject:(id)obj;

@end

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
- (instancetype)initWithCountLimit:(NSUInteger)limit;


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


/**
 * Returns the value associated with a given key with subscript.
 */
- (id)objectForKeyedSubscript:(id)key;


/**
 * Sets the value of the specified key in the cache with subscript.
 */
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;


@end



