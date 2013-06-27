//
//  NSColor+NSKitExtensions.h
//  NSKit
//
//  Created by Patrick Chamelo on 6/24/13.
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

/** Extends the NSColor class */
@interface NSColor (NSKitExtensions)


/**
 * Creates a random color, usefull for debugging.
 *
 * @return NSColor, a random color.
 *
 */
+ (NSColor *)randomColor;


/**
 * Coverts a HEX color (e.g. #A3A3A3) from a string.
 *
 * @param colorString The hex value to convert.
 *
 * @return NSColor, the converted color.
 *
 */
+ (NSColor *)colorFromHexRGB:(NSString *)colorString;


/**
 * Hex string from NSColor.
 *
 * @param color The NSColor to covert.
 *
 * @return NSString, the hex value.
 *
 */
+ (NSString *)hexCodeWithColor:(NSColor *)color;


/**
 * RGB string from NSColor.
 *
 * @param color The NSColor to covert.
 *
 * @return NSString, the RGB value.
 *
 */
+ (NSString *)RGBWithColor:(NSColor *)color;


/**
 * CGColorRef implmentation for to support < 10.8
 *
 * @return CGColorRef
 *
 */
- (CGColorRef)nsCGColor;


/**
 * Adjust the float pointers based on the given color
 *
 * @param red a CGFloat pointer to be adjusted
 * @param green a CGFloat pointer to be adjusted
 * @param blue a CGFloat pointer to be adjusted
 * @param color a color reference to populate the float pointers.
 *
 */
+ (void)adjustRed:(CGFloat *)red
            green:(CGFloat *)green
             blue:(CGFloat *)blue
            color:(NSColor *)color;

@end
