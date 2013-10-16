//
//  NSKitView.h
//  NSKit
//
//  Created by Patrick Chamelo on 9/29/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//


@interface NSKitView : NSView

@property (nonatomic, assign) BOOL nskit_opaque;

/*
 Subclasses may override this method to return NO if they want to suppress the default clipping.
 They may want to do this in situations where drawing performance is critical to avoid the cost 
 of setting up, enforcing, and cleaning up the clip path.
 */
@property (nonatomic, assign) BOOL nskit_wantsDefaultClipping;

@property (nonatomic, assign) BOOL nskit_ignoreMouseEvents;

@end
