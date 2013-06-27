//
//  NSView+NSKitExtensions.h
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


/** Extends the NSView */
@interface NSView (NSKitExtensions)

/**
 * The center of the frame.
 * @discussion
 * The center is specified within the coordinate system of its
 * superview and is measured in points. Setting this property
 */
@property (nonatomic, assign, setter = setCenter:) NSPoint center;

/**
 * Sets the alpha value of the view to 0 animated.
 */
- (void)fadeInAnimated;


/**
 * Sets the alpha value of the view to 1 animated.
 */
- (void)fadeOutAnimated;


/**
 * Animate changes to one or more views using the specified duration.
 *
 * @param duration The total duration of the animations, measured in seconds.
 * If you specify a negative value or 0, the changes are made without animating.
 *
 * @param animations A block object containing the changes to commit to the views.
 * This is where you programmatically change any animatable properties of the
 * views in your view hierarchy. This block takes no parameters and has no
 * return value. This parameter must not be NULL.
 *
 */
+ (void)animateWithDuration:(NSTimeInterval)duration
                 animations:(void (^)(void))animations;

/**
 * Animate changes to one or more views using the specified duration.
 *
 * @param duration The total duration of the animations, measured in seconds.
 * If you specify a negative value or 0, the changes are made without animating.
 *
 * @param animations A block object containing the changes to commit to the views.
 * This is where you programmatically change any animatable properties of the
 * views in your view hierarchy. This block takes no parameters and has no
 * return value. This parameter must not be NULL.
 *
 * @param completion A block object to be executed when the animation sequence ends. This block
 * has no return value and takes a single Boolean argument that indicates whether
 * or not the animations actually finished before the completion handler was called.
 * If the duration of the animation is 0, this block is performed at the beginning of 
 * the next run loop cycle. This parameter may be NULL.
 */
+ (void)animateWithDuration:(NSTimeInterval)duration
                 animations:(void (^)(void))animations
                 completion:(void (^)(BOOL finished))completion;

@end
