//
//  NSKitHexValueFormatter.m
//  NSKit
//
//  Created by Patrick Chamelo on 02/05/14.
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


#import "NSKitHexValueFormatter.h"

@implementation NSKitHexValueFormatter

/// Overrides
- (NSString *)stringForObjectValue:(id)string
{
    return string;
}

- (BOOL)getObjectValue:(out __autoreleasing id *)obj
             forString:(NSString *)string
      errorDescription:(out NSString *__autoreleasing *)error
{
    *obj = string;
    return YES;
}

/// Compatibility method
- (BOOL)isPartialStringValid:(NSString *)partialString
			newEditingString:(NSString **)newString
            errorDescription:(NSString **)error
{
	NSCharacterSet *disallowedCharacters =
    [[NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdefABCDEF#"] invertedSet];
    NSRange foundRange = [partialString rangeOfCharacterFromSet:disallowedCharacters];
	if(foundRange.location != NSNotFound){
        NSBeep();
        return NO;
	}
    return YES;
}

@end
