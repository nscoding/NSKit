//
//  NSKitView.m
//  NSKit
//
//  Created by Patrick Chamelo on 9/29/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//

#import "NSKitView.h"


// ------------------------------------------------------------------------------------------


@interface NSKitView()

- (void)configureCustomProperties;

@end


// ------------------------------------------------------------------------------------------


@implementation NSKitView


// ------------------------------------------------------------------------------------------
#pragma mark - Initializers
// ------------------------------------------------------------------------------------------
- (id)init
{
    if ((self = [super init]))
    {
        [self configureCustomProperties];
    }
    
    return self;
}


- (id)initWithFrame:(NSRect)frameRect
{
    if ((self = [super initWithFrame:frameRect]))
    {
        [self configureCustomProperties];
    }
    
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
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
