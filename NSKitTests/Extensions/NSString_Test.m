//
//  NSString_Test.m
//  NSKit
//
//  Created by Patrick Chamelo on 26/05/14.
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

#import "NSString+NSKitExtensions.h"


// ------------------------------------------------------------------------------------------


@interface NSString_Test : XCTestCase

@end


// ------------------------------------------------------------------------------------------


@implementation NSString_Test


// ------------------------------------------------------------------------------------------
#pragma mark - Tests
// ------------------------------------------------------------------------------------------
- (void)testTrimmingNewLines
{
    NSString *testString = @"\n\nThis is a test\n\n for new lines\n\n";
    XCTAssertTrue([[testString nskit_stringByTrimmingNewLines] isEqualToString:@"This is a test for new lines"],
                  @"New lines are not removed correctly.");
}


- (void)testTrimmingPrefixSpaces
{
    NSString *testString = @"      This is a test for prefix spaces  ";
    XCTAssertTrue([[testString nskit_stringByTrimmingPrefixSpaces] isEqualToString:@"This is a test for prefix spaces  "],
                  @"Prefix spaces are not removed correctly.");
}


- (void)testTrimmingSuffixSpaces
{
    NSString *testString = @"  This is a test for suffix spaces  ";
    XCTAssertTrue([[testString nskit_stringByTrimmingSuffixSpaces] isEqualToString:@"  This is a test for suffix spaces"],
                  @"Suffix spaces are not removed correctly.");
}


- (void)testTrimmingPrefixNewLines
{
    NSString *testString = @"\n\nThis is a test\n\n for new lines\n\n";
    XCTAssertTrue([[testString nskit_stringByTrimmingPrefixNewLines]
            isEqualToString:@"This is a test\n\n for new lines\n\n"], @"New lines are not removed correctly.");
}


- (void)testTrimmingSuffixNewLines
{
    NSString *testString = @"\n\nThis is a test\n\n for new lines\n\n";
    XCTAssertTrue([[testString nskit_stringByTrimmingSuffixNewLines]
            isEqualToString:@"\n\nThis is a test\n\n for new lines"], @"New lines are not removed correctly.");
}


@end
