//
//  NSKitKeyboardHelper.h
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

/** Keyboard helper class */
@interface NSKitKeyboardHelper : NSObject


/**
 * Check if the "Return" key is pressed for a given event.
 *
 * @param event The event to check the pressed key.
 *
 * @return YES if the return key is pressed.
 *
 */
+ (BOOL)returnKeyIsPressedForEvent:(NSEvent *)event;


/**
 * Check if the "Tab" key is pressed for a given event.
 *
 * @param event The event to check the pressed key.
 *
 * @return YES if the "Tab" key is pressed.
 *
 */
+ (BOOL)tabKeyIsPressedForEvent:(NSEvent *)event;


/**
 * Check if the "Shift" key is pressed for a given event.
 *
 * @param event The event to check the pressed key.
 *
 * @return YES if the "Shift" key is pressed.
 *
 */
+ (BOOL)shiftKeyIsPressedForEvent:(NSEvent *)event;


/**
 * Check if the "Escape" key is pressed for a given event.
 *
 * @param event The event to check the pressed key.
 *
 * @return YES if the "Escape" key is pressed.
 *
 */
+ (BOOL)escapeKeyIsPressedForEvent:(NSEvent *)event;


/**
 * Check if the "Left" key is pressed for a given event.
 *
 * @param event The event to check the pressed key.
 *
 * @return YES if the "Left" key is pressed.
 *
 */
+ (BOOL)leftKeyIsPressedForEvent:(NSEvent *)event;


/**
 * Check if the "Right" key is pressed for a given event.
 *
 * @param event The event to check the pressed key.
 *
 * @return YES if the "Right" key is pressed.
 *
 */
+ (BOOL)rightKeyIsPressedForEvent:(NSEvent *)event;


/**
 * Check if the "Up" key is pressed for a given event.
 *
 * @param event The event to check the pressed key.
 *
 * @return YES if the "Up" key is pressed.
 *
 */
+ (BOOL)upKeyIsPressedForEvent:(NSEvent *)event;


/**
 * Check if the "Down" key is pressed for a given event.
 *
 * @param event The event to check the pressed key.
 *
 * @return YES if the "Down" key is pressed.
 *
 */
+ (BOOL)downKeyIsPressedForEvent:(NSEvent *)event;


/**
 * Check if the "Control" key is pressed for a given event.
 *
 * @param event The event to check the pressed key.
 *
 * @return YES if the "Control" key is pressed.
 *
 */
+ (BOOL)controlKeyIsPressedForEvent:(NSEvent *)event;


@end
