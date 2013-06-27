//
//  NSMutableAttributedString+NSKitExtensions.h
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


@interface NSMutableAttributedString (NSKitExtensions)

/**
 * Set the text color on the attributed string.
 *
 * @param NSColor
 * Set the text color on the whole string.
 *
 */
- (void)nskit_setColor:(NSColor *)color;


/**
 * Set the text color on the attributed string.
 *
 * @param NSColor
 * The color to be set on the text.
 *
 * @param NSRange
 * Set the text color on a given range.
 *
 */
- (void)nskit_setColor:(NSColor *)color inRange:(NSRange)range;


/**
 * Set the background color on the attributed string.
 *
 * @param NSColor
 * Set the background color on the whole string.
 *
 */
- (void)nskit_setBackgroundColor:(NSColor *)color;


/**
 * Set the background color on the attributed string.
 *
 * @param NSColor
 * The background color to be set on the text.
 *
 * @param NSRange
 * Set the background color color on a given range.
 *
 */
- (void)nskit_setBackgroundColor:(NSColor *)color inRange:(NSRange)range;


/**
 * Set the font on the attributed string.
 *
 * @param NSFont
 * Set the Font color on the whole string.
 *
 */
- (void)nskit_setFont:(NSFont *)font;


/**
 * Set the font on the attributed string.
 *
 * @param NSFont
 * The Font to be set on the text.
 *
 * @param NSRange
 * Set the Font on a given range.
 *
 */
- (void)setFont:(NSFont *)font inRange:(NSRange)range;


/**
 * Set the line spacing on the attributed string.
 *
 * @param CGFloat
 * The line spacing to be set on the text.
 *
 */
- (void)nskit_setLineHeight:(CGFloat)height;


/**
 * Set the line break on the attributed string.
 *
 * @param NSLineBreakMode
 * The break mode to be set on the text.
 *
 */
- (void)nskit_setLineBreak:(NSLineBreakMode)breakMode;


/**
 * Set the text alignment on the attributed string.
 *
 * @param NSTextAlignment
 * The text alignment mode to be set on the text.
 *
 */
- (void)nskit_setAlignment:(NSTextAlignment)alignment;


/**
 * Set the text alignment & line break on the attributed string.
 *
 * @param NSLineBreakMode
 * The break mode to be set on the text.
 *
 * @param NSTextAlignment
 * The text alignment mode to be set on the text.
 *
 */
- (void)nskit_setLineBreak:(NSLineBreakMode)breakMode
              andAlignment:(NSTextAlignment)alignment;


/**
 * Set the text alignment & line break on the attributed string.
 *
 * @param NSLineBreakMode
 * The break mode to be set on the text.
 *
 * @param CGFloat
 * The line spacing to be set on the text.
 *
 * @param NSTextAlignment
 * The text alignment mode to be set on the text.
 *
 */
- (void)nskit_setLineBreak:(NSLineBreakMode)breakMode
                LineHeight:(CGFloat)height
              andAlignment:(NSTextAlignment)alignment;


/**
 * Set the shadow on the text
 *
 * @param NSColor
 * The color of the shadow of the text.
 *
 * @param NSSize
 * The offset of the shadow.
 *
 */
- (void)nskit_setShadowWithColor:(NSColor *)color
                      withOffset:(NSSize)offset

@end
