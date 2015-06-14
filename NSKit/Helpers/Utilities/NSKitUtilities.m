//
//  NSKitUtilities.m
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


#import "NSKitUtilities.h"

@implementation NSKitUtilities

#pragma mark - Email

+ (BOOL)isValidEmail:(NSString *)email
{
    email = [email stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *regex = @"^[A-Za-z0-9._%%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";
    NSPredicate *regexEmail = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regexEmail evaluateWithObject:email];
}

#pragma mark - Rects

+ (NSRect)flooredRect:(NSRect)rect
{
    return CGRectMake(floorf(rect.origin.x),
                      floorf(rect.origin.y),
                      floorf(rect.size.width),
                      floorf(rect.size.height));
}

+ (NSRect)flooredOriginRect:(NSRect)rect
{
    return CGRectMake(floorf(rect.origin.x),
                      floorf(rect.origin.y),
                      (rect.size.width),
                      (rect.size.height));
}

+ (NSRect)ceiledRect:(NSRect)rect
{
    return CGRectMake(ceilf(rect.origin.x),
                      ceilf(rect.origin.y),
                      ceilf(rect.size.width),
                      ceilf(rect.size.height));
}

+ (NSRect)ceiledOriginRect:(NSRect)rect
{
    return CGRectMake(ceilf(rect.origin.x),
                      ceilf(rect.origin.y),
                      (rect.size.width),
                      (rect.size.height));
}

#pragma mark - Screen

+ (NSScreen *)screenForMouseLocation
{
    NSPoint mouseLoc = [NSEvent mouseLocation];
    NSEnumerator *screenEnum = [[NSScreen screens] objectEnumerator];
    NSScreen *screen;
    while ((screen = [screenEnum nextObject]) && NSMouseInRect(mouseLoc, [screen frame], NO) == NO);
    return screen;
}

@end
