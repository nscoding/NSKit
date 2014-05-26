//
//  NSUserDefaults_Test.m
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


#import <XCTest/XCTest.h>
#import "NSUserDefaults+NSKitExtensions.h"


// ------------------------------------------------------------------------------------------


@interface NSUserDefaults_Test : XCTestCase @end


// ------------------------------------------------------------------------------------------


@implementation NSUserDefaults_Test


// ------------------------------------------------------------------------------------------
#pragma mark - Tests
// ------------------------------------------------------------------------------------------
- (void)testSaving
{
    [NSUserDefaults nskit_setValue:@"Test Value" forKey:@"Key 1"];
    
    XCTAssertTrue([[[NSUserDefaults standardUserDefaults] objectForKey:@"Key 1"]
                   isEqualToString:@"Test Value"], @"String should match");
    
    XCTAssertFalse([[[NSUserDefaults standardUserDefaults] objectForKey:@"Key 1"]
                   isEqualToString:@""], @"String should not match");
    
    [NSUserDefaults nskit_setValue:nil forKey:@"Key 1"];
    
    XCTAssertFalse([[[NSUserDefaults standardUserDefaults] objectForKey:@"Key 1"]
                   isEqualToString:@"Test Value"], @"String should match");
    
    XCTAssertFalse([[[NSUserDefaults standardUserDefaults] objectForKey:@"Key 1"]
                    isEqualToString:@""], @"String should not match");
    
    XCTAssertTrue([[NSUserDefaults standardUserDefaults] objectForKey:@"Key 1"] == nil,
                  @"String should not match");
}


- (void)testObtaining
{
    [NSUserDefaults nskit_setValue:nil forKey:@"Key 1"];
    
    XCTAssertTrue([NSUserDefaults nskit_valueForKey:@"Key 1"] == nil, @"String should match");
    [NSUserDefaults nskit_setValue:@"Test Value" forKey:@"Key 1"];
    
    XCTAssertTrue([[NSUserDefaults nskit_valueForKey:@"Key 1"] isEqualToString:@"Test Value"], @"String should match");
    XCTAssertFalse([[NSUserDefaults nskit_valueForKey:@"Key 1"] isEqualToString:@""], @"String should not match");
}


@end
