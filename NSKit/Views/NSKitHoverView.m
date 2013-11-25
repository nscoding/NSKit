//
//  NSKitHoverView.m
//  NSKit
//
//  Created by Patrick Chamelo on 25/11/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//

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
    [self removeTrackingArea:self.trackingArea];
    self.trackingArea = nil;

    NSInteger trackingOptions = (NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways);
    
    self.trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds
                                                     options:trackingOptions
                                                       owner:self
                                                    userInfo:nil];
    [self addTrackingArea:self.trackingArea];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Overrides
// ------------------------------------------------------------------------------------------
- (void)setFrame:(NSRect)frameRect
{
    if (NSEqualRects(frameRect, self.frame) == NO)
    {
        [super setFrame:frameRect];
        [self buildAndConfigureTrackingArea];
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
- (void)mouseUp:(NSEvent *)theEvent
{
    if (self.isHidden || self.alphaValue == 0.0f || self.enabled == NO)
    {
        return;
    }
    
    if ([theEvent isMouseUp])
    {
        NSPoint locationInView = [self.window.contentView convertPoint:theEvent.locationInWindow
                                                                toView:self];
        
        if (NSPointInRect(locationInView, self.bounds))
        {
            [self.imageView setImage:self.hoverImage];
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(hoverViewPressed:)])
            {
                [self.delegate hoverViewPressed:self];
            }
        }
        else
        {
            [self.imageView setImage:self.normalImage];
        }
    }
}


- (void)mouseDown:(NSEvent *)theEvent
{
    if ([theEvent isMouseDown])
    {
        [self.imageView setImage:self.pressedImage];
    }
}


- (void)mouseEntered:(NSEvent *)theEvent
{
    [self.imageView setImage:self.hoverImage];
}


- (void)mouseExited:(NSEvent *)theEvent
{
    [self.imageView setImage:self.normalImage];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Dealloc
// ------------------------------------------------------------------------------------------
- (void)dealloc
{
    [self removeTrackingArea:self.trackingArea];
    self.trackingArea = nil;
    self.delegate = nil;
}


@end
