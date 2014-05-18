//
//  NSKitHoverView.m
//  NSKit
//
//  Created by Patrick Chamelo on 25/11/13.
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


#import "NSKitHoverView.h"
#import "NSEvent+NSKitExtensions.h"


// ------------------------------------------------------------------------------------------


@interface NSKitHoverView ()

@property (nonatomic, strong) NSTrackingArea *trackingArea;
@property (nonatomic, strong) NSImageView *imageView;

@end


// ------------------------------------------------------------------------------------------


@implementation NSKitHoverView

// ------------------------------------------------------------------------------------------
#pragma mark - Initializer
// ------------------------------------------------------------------------------------------
- (instancetype)initWithFrame:(NSRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self configureLayer];
        [self buildAndConfigureImageView];
        [self buildAndConfigureTrackingArea];
    }
    
    return self;
}


- (void)configureLayer
{
    [self setWantsLayer:YES];
    self.layerContentsRedrawPolicy = NSViewLayerContentsRedrawOnSetNeedsDisplay;
    self.enabled = YES;
}


- (void)buildAndConfigureImageView
{
    self.imageView = [[NSImageView alloc] initWithFrame:self.bounds];
    self.imageView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [self addSubview:self.imageView];
}


- (void)buildAndConfigureTrackingArea
{
    NSInteger trackingOptions = (NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways);
    self.trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds
                                                     options:trackingOptions
                                                       owner:self
                                                    userInfo:nil];
    [self addTrackingArea:self.trackingArea];
}


- (void)updateTrackingAreas
{
    [self removeTrackingArea:self.trackingArea];
    self.trackingArea = nil;
    
    [self buildAndConfigureTrackingArea];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Overrides
// ------------------------------------------------------------------------------------------
- (void)setFrame:(NSRect)frameRect
{
    if (NSEqualRects(frameRect, self.frame) == NO)
    {
        [super setFrame:frameRect];
        [self updateTrackingAreas];
    }
}


- (void)setNormalImage:(NSImage *)normalImage
{
    _normalImage = normalImage;
    
    if (self.imageView.image == nil)
    {
        [self.imageView setImage:_normalImage];
    }
}


// ------------------------------------------------------------------------------------------
#pragma mark - Mouse events
// ------------------------------------------------------------------------------------------
- (void)mouseUp:(NSEvent *)event
{
    if (self.isHidden || self.alphaValue == 0.0f || self.enabled == NO)
    {
        return;
    }
    
    if ([event isMouseUp])
    {
        NSPoint locationInView = [self.window.contentView convertPoint:event.locationInWindow toView:self];
        if (NSPointInRect(locationInView, self.bounds))
        {
            [self.imageView setImage:self.hoveredImage];
            [self fireAction];
        }
        else
        {
            [self.imageView setImage:self.normalImage];
        }
    }
}


- (void)mouseDown:(NSEvent *)event
{
    if ([event isMouseDown])
    {
        [self.imageView setImage:self.pressedImage];
    }
}


- (void)mouseEntered:(NSEvent *)event
{
    [self.imageView setImage:self.hoveredImage];
}


- (void)mouseExited:(NSEvent *)event
{
    [self.imageView setImage:self.normalImage];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Action
// ------------------------------------------------------------------------------------------
- (void)fireAction
{
    if (self.target && self.action)
    {
        NSMethodSignature *signature = [[self.target class] instanceMethodSignatureForSelector:self.action];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self.target];
        [invocation setSelector:self.action];
        
        /**
         There are always at least 2 arguments, because an NSMethodSignature object
         includes the hidden arguments self and _cmd, which are the first two arguments
         passed to every method implementation.
         */

        NSInteger numberOfArguments = [signature numberOfArguments];
        if (numberOfArguments == 3)
        {
            [invocation setArgument:(void *)&self atIndex:2];
        }

        if (numberOfArguments > 3)
        {
            @throw [NSException exceptionWithName:@"Invalid Signature"
                                           reason:@"Please make sure that the method signature has 1 or less arguments"
                                         userInfo:nil];
        }

        [invocation invoke];
    }
}


// ------------------------------------------------------------------------------------------
#pragma mark - Dealloc
// ------------------------------------------------------------------------------------------
- (void)dealloc
{
    [self removeTrackingArea:self.trackingArea];
    self.trackingArea = nil;
    self.target = nil;
}


@end
