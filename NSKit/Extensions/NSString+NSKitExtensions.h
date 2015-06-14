//
//  NSString+NSKitExtensions.h
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


/** Extends the NSString class. */
@interface NSString (NSKitExtensions)

/**
 * Removes new lines from a string.
 *
 * @return NSString A string without any new line characters.
 *
 */
- (NSString *)nskit_stringByTrimmingNewLines;

/**
 * Removes all prefix whitespaces from a string.
 *
 * @return NSString A string without any white spaces at the beginning.
 *
 */
- (NSString *)nskit_stringByTrimmingPrefixSpaces;

/**
 * Removes all suffix whitespaces from a string.
 *
 * @return NSString A string without any white spaces at the end.
 *
 */
- (NSString *)nskit_stringByTrimmingSuffixSpaces;

/**
 * Removes all prefix new lines from a string.
 *
 * @return NSString A string without any new lines at the beginning.
 *
 */
- (NSString *)nskit_stringByTrimmingPrefixNewLines;

/**
 * Removes all suffix new lines from a string.
 *
 * @return NSString A string without any new lines at the end.
 *
 */
- (NSString *)nskit_stringByTrimmingSuffixNewLines;

/**
 * URL encoding for a string.
 *
 * @return NSString A url encoded string.
 *
 */
- (NSString *)nskit_stringByUrlEncoding;

@end
