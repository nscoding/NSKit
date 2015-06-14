//
//  NSEvent+NSKitExtensions.h
//  NSKit
//
//  Created by Patrick Chamelo on 6/24/13.
//  Copyright (c) 2015 Patrick Chamelo. All rights reserved.
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


@interface NSEvent (NSKitExtensions)

/**
 * Check if the event is of any mouse up type.
 *
 * @return YES if is NSLeftMouseUp or NSRightMouseUp or NSOtherMouseUp otherwise, NO.
 */
- (BOOL)nskit_isMouseUp;

/**
 * Check if the event is of any mouse down type.
 *
 * @return YES if is NSLeftMouseDown or NSRightMouseDown or NSOtherMouseDown otherwise, NO.
 */
- (BOOL)nskit_isMouseDown;

/**
 * Check if the event responds to click count method.
 *
 * @return YES if it does respond, otherwise NO.
 */
- (BOOL)nskit_hasClickCount;

/**
 * Check if the event is a single click.
 *
 * @return YES if it is single click, otherwise NO.
 */
- (BOOL)nskit_isSingleClick;

/**
 * Check if the event is a double click.
 *
 * @return YES if it is double click, otherwise NO.
 */
- (BOOL)nskit_isDoubleClick;

@end
