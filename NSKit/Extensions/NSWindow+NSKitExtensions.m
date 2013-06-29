//
//  NSWindow+NSKitExtensions.m
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


#import "NSWindow+NSKitExtensions.h"


// ------------------------------------------------------------------------------------------


@implementation NSWindow (NSKitExtensions)


// ------------------------------------------------------------------------------------------
#pragma mark - Object methods
// ------------------------------------------------------------------------------------------
- (void)centerHorizontallyAndVerticallyOnScreen:(NSScreen *)screen
{
    NSRect box = self.frame;
    
    NSRect screenBox;
    
    if (screen)
    {
        screenBox = screen.visibleFrame;
    }
    else
    {
        screenBox = [NSScreen mainScreen].visibleFrame;
    }
    
    box.origin.y = screenBox.origin.y + truncf((screenBox.size.height -box.size.height) /2);
    box.origin.x = screenBox.origin.x + truncf((screenBox.size.width -box.size.width) /2);
    
    [self setFrame:box display:NO];
}


- (void)centerHorizontallyAndVertically
{
    [self centerHorizontallyAndVerticallyOnScreen:self.screen];
}


- (BOOL)isFullScreen
{
    if (SystemAtLeastLion)
    {
        return (([self styleMask] & NSFullScreenWindowMask) == NSFullScreenWindowMask);
    }
    
    return NO;
}


@end
