//
//  NSKitLRUCache_Test.m
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

#import <XCTest/XCTest.h>

#import "NSKitCacheEntry.h"
#import "NSKitLRUCache.h"

@interface NSKitLRUCache_Test : XCTestCase <NSKitLRUCacheDelegate>
@end

@implementation NSKitLRUCache_Test
{
    BOOL _delegateShouldBeCalled;
}

#pragma mark - Tests

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

    _delegateShouldBeCalled = YES;
    [lruCache setObject:string5 forKey:string6];
    [lruCache setObject:string6 forKey:string6];

    lruCache.countLimit = 6;
    _delegateShouldBeCalled = NO;

    [lruCache setObject:string7 forKey:string7];
    [lruCache setObject:string1 forKey:string1];
    
    _delegateShouldBeCalled = YES;
    [lruCache setObject:string6 forKey:string6];
    [lruCache setObject:string3 forKey:string3];
}

- (void)testKeyedSubscripting
{
    NSString *string1 = @"Test 1";
    NSString *string2 = @"Test 2";

    NSKitLRUCache *lruCache = [[NSKitLRUCache alloc] initWithCountLimit:4];
    [lruCache setObject:string1 forKey:string1];
    [lruCache setObject:string2 forKey:string2];
    XCTAssertTrue((lruCache[@"Test 1"] == string1), @"Object for key was wrong");
    XCTAssertTrue((lruCache[@"Test 2"] != string1), @"Object for key was wrong");
    XCTAssertTrue((lruCache[@"Test 2"] == string2), @"Object for key was wrong");
    
    lruCache[string2] = string1;
    XCTAssertTrue((lruCache[@"Test 2"] == string1), @"Object for key was wrong");
}

#pragma mark - NSKitLRUCacheDelegate

- (void)leastRecentlyUsedCache:(NSKitLRUCache *)cache willEvictObject:(id)obj;
{
    XCTAssertTrue((obj != nil), @"Object evicted cannot be nil");
    XCTAssertTrue((_delegateShouldBeCalled == YES), @"Will evict should not be called");
}

@end
