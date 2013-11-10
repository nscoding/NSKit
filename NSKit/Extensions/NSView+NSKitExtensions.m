//
//  NSView+NSKitExtensions.m
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


#import "NSView+NSKitExtensions.h"


// ------------------------------------------------------------------------------------------


@implementation NSView (NSKitExtensions)

@dynamic center;
@dynamic centerOnFrame;


// ------------------------------------------------------------------------------------------
#pragma mark - Object Methods
// ------------------------------------------------------------------------------------------
- (void)setCenter:(NSPoint)center
{
    [self setFrameOrigin:NSMakePoint(floorf(center.x - (NSWidth(self.bounds)) / 2),
                                     floorf(center.y - (NSHeight(self.bounds)) / 2))];
}

- (NSPoint)center
{
    return NSMakePoint(floorf(self.bounds.origin.x + (self.bounds.size.width / 2)),
                       floorf(self.bounds.origin.y + (self.bounds.size.height / 2)));
}


- (NSPoint)centerOnFrame
{
    return NSMakePoint(floorf(self.frame.origin.x + (self.frame.size.width / 2)),
                       floorf(self.frame.origin.y + (self.frame.size.height / 2)));
}


- (void)setCenter:(NSPoint)center animated:(BOOL)animate
{
    if (animate)
    {
        [[self animator] setFrameOrigin:NSMakePoint(floorf(center.x - (NSWidth([self bounds])) / 2),
                                                    floorf(center.y - (NSHeight([self bounds])) / 2))];
    }
    else
    {
        [self setCenter:center];
    }
}


- (void)fadeInAnimated
{
    ((NSView *)self.animator).alphaValue = 1.0f;
}


- (void)fadeOutAnimated
{
    ((NSView *)self.animator).alphaValue = 0.0f;
}


// ------------------------------------------------------------------------------------------
#pragma mark - Class Methods
// ------------------------------------------------------------------------------------------
+ (void)animateWithDuration:(NSTimeInterval)duration
                 animations:(void (^)(void))animations
{
    NSCKitAssert(animations, @"Animations parameter must not be NULL");
    
    [NSView animateWithDuration:duration
                     animations:animations
                     completion:NULL];
}


+ (void)animateWithDuration:(NSTimeInterval)duration
                 animations:(void (^)(void))animations
                 completion:(void (^)(BOOL finished))completion
{
    NSCKitAssert(animations, @"Animations parameter must not be NULL");
    
    if (SystemAtLeastLion)
    {
        [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context)
        {
            animations();
        }
        completionHandler:^
        {
            if (completion)
            {
                completion(YES);
            }
        }];
    }
    else
    {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:duration];
        animations();
        [NSAnimationContext endGrouping];
        
        if (completion)
        {
            dispatch_block_t completionBlock = ^
            {
                completion(YES);
            };
            
            dispatch_time_t popTime = dispatch_time( DISPATCH_TIME_NOW, (double)duration * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), completionBlock);
        }
    }
}


@end
