//
//  NSKitProgressView.h
//  NSKit
//
//  Created by Patrick Chamelo on 26/05/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
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


@interface NSKitProgressView : NSView

/// The current progress shown by the receiver.
@property (nonatomic, assign) CGFloat progress;

/// The line width of the receiver progress bar, defaults to 3.0f.
@property (nonatomic, assign) CGFloat progressLineWidth;

/// The progress line color, defaults to light gray.
@property (nonatomic, strong) NSColor *progressLineColor;

/// The line width of the receiver background bar, defaults to 6.0f.
@property (nonatomic, assign) CGFloat backgroundLineWidth;

/// The background line color, defaults to dark gray.
@property (nonatomic, strong) NSColor *backgroundLineColor;

/// Specifies the basic duration of the animation, in seconds, defaults to 0.4.
@property (nonatomic, assign) CFTimeInterval duration;

/// Adjusts the current progress shown by the receiver, optionally animating the change.
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
