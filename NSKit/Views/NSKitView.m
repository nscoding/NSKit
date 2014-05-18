//
//  NSKitView.m
//  NSKit
//
//  Created by Patrick Chamelo on 9/29/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
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


#import "NSKitView.h"


// ------------------------------------------------------------------------------------------


@implementation NSKitView


// ------------------------------------------------------------------------------------------
#pragma mark - Initializers
// ------------------------------------------------------------------------------------------
- (instancetype)init
{
    if ((self = [super init]))
    {
        [self configureCustomProperties];
    }
    
    return self;
}


- (instancetype)initWithFrame:(NSRect)frameRect
{
    if ((self = [super initWithFrame:frameRect]))
    {
        [self configureCustomProperties];
    }
    
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self configureCustomProperties];
    }
    
    return self;
}


// ------------------------------------------------------------------------------------------
#pragma mark - Configure Custom Properties
// ------------------------------------------------------------------------------------------
- (void)configureCustomProperties
{
    self.nskit_opaque = NO;
    self.nskit_wantsDefaultClipping = YES;
    self.nskit_ignoreMouseEvents = NO;
}


// ------------------------------------------------------------------------------------------
#pragma mark - Overrides
// ------------------------------------------------------------------------------------------
- (BOOL)isOpaque
{
    return self.nskit_opaque;
}


- (BOOL)wantsDefaultClipping
{
    return self.nskit_wantsDefaultClipping;
}


- (NSView *)hitTest:(NSPoint)aPoint
{
    if (self.nskit_ignoreMouseEvents)
    {
        return nil;
    }
    
    return [super hitTest:aPoint];
}


@end
