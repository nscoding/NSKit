//
//  NSKitHoverView.h
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


@interface NSKitHoverView : NSView

/// The NSImage object displayed by the receiver on the normal state.
@property (nonatomic, strong) NSImage *normalImage;

/// The NSImage object displayed by the receiver on the hovered state.
@property (nonatomic, strong) NSImage *hoveredImage;

/// The NSImage object displayed by the receiver on the pressed state.
@property (nonatomic, strong) NSImage *pressedImage;

/// A selector identifying the method to invoke on the given target.
@property (nonatomic, assign) SEL action;

/// The receiver of the corresponding to selector name when the view is clicked.
@property (nonatomic, strong) id target;

/// Property to enable or disable the user interaction with the view.
@property (nonatomic, assign, getter=isEnabled) BOOL enabled;

@end
