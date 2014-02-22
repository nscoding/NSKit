//
//  NSKitLRUCache_Test.m
//  NSKit
//
//  Created by Patrick Chamelo on 22/02/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSKitCacheEntry.h"
#import "NSKitLRUCache.h"


@interface NSKitLRUCache_Test : XCTestCase <NSKitLRUCacheDelegate>

@property (nonatomic, assign) BOOL delegateShouldBeCalled;

@end


@implementation NSKitLRUCache_Test


// ------------------------------------------------------------------------------------------
#pragma mark - Tests
// ------------------------------------------------------------------------------------------
- (void)testInsert
{
    NSKitLRUCache *lruCache = [[NSKitLRUCache alloc] initWithCountLimit:4];
    lruCache.delegate = self;
    
    NSString *string1 = @"Test 1";
    NSString *string2 = @"Test 2";
    NSString *string3 = @"Test 3";
    NSString *string4 = @"Test 4";
    NSString *string5 = @"Test 5";
    NSString *string6 = @"Test 6";
    NSString *string7 = @"Test 7";

    [lruCache setObject:string1 forKey:string1];
    [lruCache setObject:string2 forKey:string2];
    [lruCache setObject:string3 forKey:string3];
    [lruCache setObject:string4 forKey:string4];
    [lruCache setObject:string2 forKey:string2];

    self.delegateShouldBeCalled = YES;
    [lruCache setObject:string5 forKey:string6];
    [lruCache setObject:string6 forKey:string6];

    lruCache.countLimit = 6;
    self.delegateShouldBeCalled = NO;

    [lruCache setObject:string7 forKey:string7];
    [lruCache setObject:string1 forKey:string1];
    
    self.delegateShouldBeCalled = YES;
    [lruCache setObject:string6 forKey:string6];
    [lruCache setObject:string3 forKey:string3];
}


// ------------------------------------------------------------------------------------------
#pragma mark - NSKitLRUCacheDelegate
// ------------------------------------------------------------------------------------------
- (void)leastRecentlyUsedCache:(NSKitLRUCache *)cache willEvictObject:(id)obj;
{
    XCTAssertTrue((obj != nil), @"Object evicted cannot be nil");
    XCTAssertTrue((self.delegateShouldBeCalled == YES), @"Will evict should not be called");
}


@end
