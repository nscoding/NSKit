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

@property (nonatomic, strong) NSImage *normalImage;
@property (nonatomic, strong) NSImage *hoverImage;
@property (nonatomic, strong) NSImage *pressedImage;

@property (nonatomic, unsafe_unretained) id<NSKitHoverViewDelegate> delegate;
@property (nonatomic, assign) NSUInteger actionTag;
@property (nonatomic, assign) BOOL enabled;


@end
