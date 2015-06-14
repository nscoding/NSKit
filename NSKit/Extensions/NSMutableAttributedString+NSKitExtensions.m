//
//  NSMutableAttributedString+NSKitExtensions.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/24/13.
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


#import "NSMutableAttributedString+NSKitExtensions.h"

@implementation NSMutableAttributedString (NSKitExtensions)

#pragma mark - Methods

- (void)nskit_setColor:(NSColor *)color
{
    [self nskit_setColor:color inRange:NSMakeRange(0, self.length)];
}

- (void)nskit_setColor:(NSColor *)color inRange:(NSRange)range
{
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
}

- (void)nskit_setBackgroundColor:(NSColor *)color
{
    [self nskit_setBackgroundColor:color inRange:NSMakeRange(0, self.length)];
}

- (void)nskit_setBackgroundColor:(NSColor *)color inRange:(NSRange)range
{
    [self addAttribute:NSBackgroundColorAttributeName value:color range:range];
}

- (void)nskit_setFont:(NSFont *)font
{
    [self setFont:font inRange:NSMakeRange(0, self.length)];
}

- (void)setFont:(NSFont *)font inRange:(NSRange)range
{
    NSCKitAssert(font, @"Font cannot be nil");
    [self addAttribute:NSFontAttributeName value:font range:range];
}

- (void)nskit_setLineHeight:(CGFloat)height
{
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setLineSpacing:height];
    [self addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.length)];
}

- (void)nskit_setLineBreak:(NSLineBreakMode)breakMode
{
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setLineBreakMode:breakMode];
    [self addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.length)];
}

- (void)nskit_setAlignment:(NSTextAlignment)alignment
{
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:alignment];
    [self addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.length)];
}

- (void)nskit_setLineBreak:(NSLineBreakMode)breakMode
              andAlignment:(NSTextAlignment)alignment
{
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setLineBreakMode:breakMode];
    [style setAlignment:alignment];
    [self addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.length)];
}

- (void)nskit_setLineBreak:(NSLineBreakMode)breakMode
                LineHeight:(CGFloat)height
              andAlignment:(NSTextAlignment)alignment
{
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setLineBreakMode:breakMode];
    [style setLineSpacing:height];
    [style setAlignment:alignment];
    [self addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.length)];
}

- (void)nskit_setShadowWithColor:(NSColor *)color
                      withOffset:(NSSize)offset
{
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = color;
    shadow.shadowOffset = offset;
    [self addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(0, self.length)];
}

@end
