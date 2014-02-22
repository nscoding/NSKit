//
//  NSKitCacheEntry.m
//  NSKit
//
//  Created by Patrick Chamelo on 22/02/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//

#import "NSKitCacheEntry.h"


// ------------------------------------------------------------------------------------------


@implementation NSKitCacheEntry


// ------------------------------------------------------------------------------------------
#pragma mark - Initializers
// ------------------------------------------------------------------------------------------
- (id)init
{
    return [self initWithObject:nil forKey:nil];
}


- (id)initWithObject:(id)anObject forKey:(id)aKey
{
    if ((self = [super init]))
    {
        self.key = aKey;
        self.object = anObject;
    }
    
    return self;
}


@end
