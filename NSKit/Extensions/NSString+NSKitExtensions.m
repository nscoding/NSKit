//
//  NSString+NSKitExtensions.m
//  NSKit
//
//  Created by Patrick Chamelo on 9/12/13.
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


#import "NSString+NSKitExtensions.h"

@implementation NSString (NSKitExtensions)

#pragma mark - Methods

- (NSString *)nskit_stringByTrimmingNewLines
{
    NSString *trimmedString = [self copy];
    trimmedString = [trimmedString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    trimmedString = [trimmedString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    trimmedString = [trimmedString nskit_stringByTrimmingPrefixSpaces];
    trimmedString = [trimmedString nskit_stringByTrimmingSuffixSpaces];
    return trimmedString;
}

- (NSString *)nskit_stringByTrimmingPrefixSpaces
{
    NSString *trimmedString = [self copy];
    while ([trimmedString hasPrefix:@" "] == YES) {
        trimmedString = [trimmedString stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
    }
    return trimmedString;
}

- (NSString *)nskit_stringByTrimmingSuffixSpaces
{
    NSString *trimmedString = [self copy];
    while ([trimmedString hasSuffix:@" "] == YES) {
        trimmedString = [trimmedString stringByReplacingCharactersInRange:NSMakeRange(trimmedString.length - 1, 1)
                                                               withString:@""];
    }
    return trimmedString;
}

- (NSString *)nskit_stringByTrimmingPrefixNewLines
{
    NSString *trimmedString = [self copy];
    NSRange range = [trimmedString rangeOfString:@"^\\s*" options:NSRegularExpressionSearch];
    
    return [trimmedString stringByReplacingCharactersInRange:range withString:@""];
}

- (NSString *)nskit_stringByTrimmingSuffixNewLines
{
    NSString *trimmedString = [self copy];
    NSRange range = [trimmedString rangeOfString:@"\\s*$" options:NSRegularExpressionSearch];
    return [trimmedString stringByReplacingCharactersInRange:range withString:@""];
}


- (NSString *)nskit_stringByUrlEncoding
{
    static NSString * const kAFLegalCharactersToBeEscaped = @"?!@#$^&%*+=,:;'\"`<>()[]{}/\\|~ ";
    return (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes
        (NULL, (CFStringRef)self,  NULL,  (CFStringRef)kAFLegalCharactersToBeEscaped,  kCFStringEncodingUTF8);
}

@end
