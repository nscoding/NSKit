//
//  NSKitMath.h
//  NSKit
//
//  Created by Patrick Chamelo on 6/28/13.
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

/** Math helpers */
@interface NSKitMath : NSObject

/**
 * Checks if the float has decimal points.
 *
 * @param value The value to check
 *
 * @return YES if the number has decimal points; otherwise, NO.
 *
 */
+ (BOOL)hasDecimalPoints:(CGFloat)value;

/**
 * Generates a random number from a start to end.
 *
 * @param start The starting value for the random generation
 * @param end The ending value for the random generation
 *
 * @return NSInteger A random number between start and end. 
 *
 * @warning *Important:* If the start value is higher than the end value, an exception is raised.
 *
 */
+ (NSInteger)generateRandomFromNumber:(NSInteger)start toNumber:(NSInteger)end;

@end
