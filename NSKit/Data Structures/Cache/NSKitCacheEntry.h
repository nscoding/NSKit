//
//  NSKitCacheEntry.h
//  NSKit
//
//  Created by Patrick Chamelo on 22/02/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//


@interface NSKitCacheEntry : NSObject


/**
 * The value for aKey. A strong reference to the object is maintained by the dictionary.
 */
@property (nonatomic, strong, readwrite) id object;


/**
 * The key for value. The key is copied (keys must conform to the NSCopying protocol).
 */
@property (nonatomic, copy, readwrite) id<NSCopying> key;


- (id)initWithObject:(id)anObject forKey:(id)aKey;

@end
