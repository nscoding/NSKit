//
//  NSKitUtilities.h
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

/** Several different helpers */
@interface NSKitUtilities : NSObject


/**
 * The methood returns true if the given string contains a valid e-mail
 * address and false if it does not, but takes no other action.
 *
 * @param email The Email of the user
 *
 * @return YES if the email is valid; otherwise, NO.
 *
 */
+ (BOOL)isValidEmail:(NSString *)email;


/**
 * Receives a rect and floors, x, y, width and height.
 *
 * @param rect The NSRect to floor
 *
 * @return NSRect the floored rect.
 *
 */
+ (NSRect)flooredRect:(NSRect)rect;


/**
 * Receives a rect and floors the origin of the rect, (x and y)
 *
 * @param rect The NSRect to floor the origin.
 *
 * @return NSRect the floored origin rect.
 *
 */
+ (NSRect)flooredOriginRect:(NSRect)rect;


/**
 * Receives a rect and ceils, x, y, width and height.
 *
 * @param rect The NSRect to ceil.
 *
 * @return NSRect the ceiled rect.
 *
 */
+ (NSRect)ceiledRect:(NSRect)rect;


/**
 * Receives a rect and ceils the origin of the rect, (x and y)
 *
 * @param rect The NSRect to floor the origin.
 *
 * @return NSRect the floored origin rect.
 *
 */
+ (NSRect)ceiledOriginRect:(NSRect)rect;


/**
 * Returns the screen where the mouse is located
 *
 * @return NSScreen where the mouse is located.
 *
 */
+ (NSScreen *)screenForMouseLocation;


@end
