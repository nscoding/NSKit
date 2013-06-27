//
//  NSImage+NSKitExtensions.m
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


#import "NSImage+NSKitExtensions.h"


@implementation NSImage (NSKitExtensions)


+ (NSImage *)stretchableImageWithLeftWidth:(CGFloat)leftWidth
                               middleWidth:(CGFloat)patternWidth
                                rightWidth:(CGFloat)rightWidth
                                    toSize:(NSSize)destinationSize
                                 leftImage:(NSImage *)leftImage
                               middleImage:(NSImage *)middleImage
                                rightImage:(NSImage *)rightImage

{
    NSImage *destinationImage = [[NSImage alloc] initWithSize:destinationSize];
    NSRect leftCorner = NSMakeRect(0, 0, leftWidth, destinationSize.height);
    NSRect centerArea = NSMakeRect(leftWidth, 0, destinationSize.width - rightWidth, destinationSize.height);
    NSRect rightArea = NSMakeRect(ceilf(destinationSize.width - rightWidth), 0, rightWidth, destinationSize.height);
    [NSGraphicsContext saveGraphicsState];
    [destinationImage lockFocus];
    
    [leftImage drawInRect:leftCorner fromRect:NSZeroRect operation:NSCompositeCopy fraction:1.0];
    
    for (CGFloat step = leftWidth; step < centerArea.size.width; step += patternWidth)
    {
        [middleImage drawInRect:NSMakeRect(step, 0, patternWidth, destinationSize.height)
                       fromRect:NSZeroRect
                      operation:NSCompositeCopy
                       fraction:1.0];
    }
    
    [rightImage drawInRect:rightArea fromRect:NSZeroRect operation:NSCompositeCopy fraction:1.0];
    [destinationImage unlockFocus];
    
    [NSGraphicsContext restoreGraphicsState];
    return destinationImage;
}


+ (NSImage *)stretchableImageWithLeftWidth:(CGFloat)leftWidth
                               middleWidth:(CGFloat)patternWidth
                                rightWidth:(CGFloat)rightWidth
                                    toSize:(NSSize)destinationSize
                                 fromImage:(NSImage *)sourceImage
{
    NSImage *destinationImage = [[NSImage alloc] initWithSize:destinationSize];
    
    // get the left corner
    NSRect leftCorner = NSMakeRect(0, 0, leftWidth, destinationSize.height);
    
    // get the patter area
    NSRect patternArea = NSMakeRect(leftWidth, 0, patternWidth, destinationSize.height);
    
    // calculate the center area
    NSRect centerArea = NSMakeRect(leftWidth, 0, destinationSize.width - rightWidth, destinationSize.height);
    
    
    NSRect rightCorner = NSMakeRect(sourceImage.size.width - rightWidth, 0, rightWidth, destinationSize.height);
    NSRect rightArea = NSMakeRect(destinationSize.width - rightWidth, 0, rightWidth, destinationSize.height);
    
    [NSGraphicsContext saveGraphicsState];
    [destinationImage lockFocus];
    
    // draw the left iamge
    [sourceImage drawInRect:leftCorner fromRect:leftCorner operation:NSCompositeCopy fraction:1.0];
    
    // draw the pattern in the middle
    for (CGFloat step = leftWidth; step < centerArea.size.width; step += patternWidth)
    {
        [sourceImage drawInRect:NSMakeRect(step, 0, patternWidth, destinationSize.height)
                       fromRect:patternArea
                      operation:NSCompositeCopy
                       fraction:1.0];
    }
    
    // draw the right image
    [sourceImage drawInRect:rightArea
                   fromRect:rightCorner
                  operation:NSCompositeCopy
                   fraction:1.0];
    
    
    [destinationImage unlockFocus];
    
    [NSGraphicsContext restoreGraphicsState];
    return destinationImage;
}


+ (NSImage *)stretchableImageWithTopWidth:(CGFloat)topheight
                              middleWidth:(CGFloat)patternHeight
                              bottomWidth:(CGFloat)bottomHeight
                                   toSize:(NSSize)destinationSize
                                fromImage:(NSImage *)sourceImage
{
    NSImage *destinationImage = [[NSImage alloc] initWithSize:destinationSize];
    
    NSRect bottomCorner = NSMakeRect(0, 0, destinationSize.width, bottomHeight);
    NSRect bottomArea = NSMakeRect(0, 0, destinationSize.width, bottomHeight);
    
    
    // get the top corner
    NSRect topCorner = NSMakeRect(0, bottomHeight + patternHeight, destinationSize.width, topheight);
    NSRect topArea = NSMakeRect(0, destinationSize.height - topheight, destinationSize.width, topheight);
    
    [NSGraphicsContext saveGraphicsState];
    [destinationImage lockFocus];
    
    // get the patter area
    NSRect patternArea = NSMakeRect(0, bottomHeight, destinationSize.width, patternHeight);
    
    CGFloat spaceLeftHeight = 0;
    // draw the pattern in the middle
    for (CGFloat step = bottomHeight;
         step < (destinationSize.height - bottomHeight - topheight);
         step += patternHeight)
    {
        spaceLeftHeight = (destinationSize.height - bottomHeight - topheight) - step;
        [sourceImage drawInRect:NSMakeRect(0, step, destinationSize.width, patternHeight)
                       fromRect:patternArea
                      operation:NSCompositeCopy
                       fraction:1.0];
    }
    
    patternArea = NSMakeRect(0, bottomHeight, destinationSize.width, spaceLeftHeight);
    
    [sourceImage drawInRect:NSMakeRect(0, destinationSize.height - topheight - spaceLeftHeight,
                                       destinationSize.width, spaceLeftHeight)
                   fromRect:patternArea
                  operation:NSCompositeCopy
                   fraction:1.0];
    
    
    // draw the botttom image
    [sourceImage drawInRect:bottomArea
                   fromRect:bottomCorner
                  operation:NSCompositeCopy
                   fraction:1.0];
    
    // draw the top image
    [sourceImage drawInRect:topArea
                   fromRect:topCorner
                  operation:NSCompositeCopy
                   fraction:1.0];
    
    
    [destinationImage unlockFocus];
    
    [NSGraphicsContext restoreGraphicsState];
    return destinationImage;
}


@end
