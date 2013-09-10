//
//  NSImage+NSKitExtensions.h
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


/** Extends the NSImage class */
@interface NSImage (NSKitExtensions)

/**
 * Create a stretchable image from 3 different images.
 *
 * @param leftWidth The width in pixels of the left side.
 * @param patternWidth The width in pixels of the middle side.
 * @param rightWidth The width in pixels of the right side.
 * @param destinationSize The final size in pixels.
 * @param leftImage The left image.
 * @param middleImage The middle image.
 * @param rightImage The left image.
 *
 * @return NSImage A custom strechable image from left to right.
 *
 */
+ (NSImage *)stretchableImageWithLeftWidth:(CGFloat)leftWidth
                               middleWidth:(CGFloat)patternWidth
                                rightWidth:(CGFloat)rightWidth
                                    toSize:(NSSize)destinationSize
                                 leftImage:(NSImage *)leftImage
                               middleImage:(NSImage *)middleImage
                                rightImage:(NSImage *)rightImage;


/**
 * Create a stretchable image from another image.
 *
 * @param leftWidth The width in pixels of the left side.
 * @param patternWidth The width in pixels of the middle side.
 * @param rightWidth The width in pixels of the right side.
 * @param destinationSize The final size in pixels.
 * @param sourceImage The source image.
 *
 * @return NSImage A custom strechable image from left to right,
 *
 */
+ (NSImage *)stretchableImageWithLeftWidth:(CGFloat)leftWidth
                               middleWidth:(CGFloat)patternWidth
                                rightWidth:(CGFloat)rightWidth
                                    toSize:(NSSize)destinationSize
                                 fromImage:(NSImage *)sourceImage;


/**
 * Create a stretchable image from another image.
 *
 * @param topheight The height in pixels of the top side.
 * @param patternHeight The height in pixels of the middle side.
 * @param bottomHeight The height in pixels of the bottom side.
 * @param destinationSize The final size in pixels.
 * @param sourceImage The source image.
 *
 * @return NSImage A custom strechable image from top to bottom.
 *
 */
+ (NSImage *)stretchableImageWithTopWidth:(CGFloat)topheight
                              middleWidth:(CGFloat)patternHeight
                              bottomWidth:(CGFloat)bottomHeight
                                   toSize:(NSSize)destinationSize
                                fromImage:(NSImage *)sourceImage;
@end
