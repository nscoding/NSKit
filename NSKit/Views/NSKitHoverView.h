//
//  NSKitHoverView.h
//  NSKit
//
//  Created by Patrick Chamelo on 25/11/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//

@class NSKitHoverView;

@protocol NSKitHoverViewDelegate <NSObject>

@required
- (void)hoverViewPressed:(NSKitHoverView *)hoverView;

@end


@interface NSKitHoverView : NSView

/// The NSImage object displayed by the receiver on the normal state.
@property (nonatomic, strong) NSImage *normalImage;

/// The NSImage object displayed by the receiver on the hovered state.
@property (nonatomic, strong) NSImage *hoveredImage;

/// The NSImage object displayed by the receiver on the pressed state.
@property (nonatomic, strong) NSImage *pressedImage;

/// The receiver’s delegate.
@property (nonatomic, unsafe_unretained) id<NSKitHoverViewDelegate> delegate;

/// Property to enable or disable the user interaction with the view.
@property (nonatomic, assign) BOOL enabled;


@end
