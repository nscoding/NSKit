//
//  NSEvent+NSKitExtensions.m
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


#import "NSEvent+NSKitExtensions.h"

@implementation NSEvent (NSKitExtensions)

#pragma mark - Object Methods

- (BOOL)nskit_isMouseUp
{
    if (self.type != NSLeftMouseUp &&
        self.type != NSRightMouseUp &&
        self.type != NSOtherMouseUp){
        return NO;
    }
    return YES;
}

- (BOOL)nskit_isMouseDown
{
    if (self.type != NSLeftMouseDown &&
        self.type != NSRightMouseDown &&
        self.type != NSOtherMouseDown){
        return NO;
    }
    return YES;
}

- (BOOL)nskit_hasClickCount
{
    if ([self respondsToSelector:@selector(clickCount)] == NO){
        return NO;
    }
    return YES;
}

- (BOOL)nskit_isSingleClick
{
    if ([self nskit_hasClickCount] == NO){
        return NO;
    }
    return (self.clickCount == 1);
}

- (BOOL)nskit_isDoubleClick
{
    if ([self nskit_hasClickCount] == NO){
        return NO;
    }
    return (self.clickCount == 2);
}

@end
