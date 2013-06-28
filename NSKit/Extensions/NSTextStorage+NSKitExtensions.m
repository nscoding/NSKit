//
//  NSTextStorage+NSKitExtensions.m
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

#import "NSTextStorage+NSKitExtensions.h"


// ------------------------------------------------------------------------------------------


NSColor *NSKitTextStorageColor;
NSColor *NSKitTextStorageLinkColor;


// ------------------------------------------------------------------------------------------


@implementation NSTextStorage (NSKitExtensions)


// ------------------------------------------------------------------------------------------
#pragma mark - Methods
// ------------------------------------------------------------------------------------------
- (void)scanForLinks;
{
    [self beginEditing];
    
    NSUInteger stringLength = self.string.length;
    
    // Finally, apply those attributes to the URL in the text
    [self removeAttribute:NSLinkAttributeName range:NSMakeRange(0, stringLength)];
    [self removeAttribute:NSUnderlineStyleAttributeName range:NSMakeRange(0, stringLength)];
    [self removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, stringLength)];
    
    [self addAttribute:NSForegroundColorAttributeName
                 value:NSKitTextStorageColor
                 range:NSMakeRange(0, stringLength)];
    
    NSDataDetector *linkDetector = [NSDataDetector dataDetectorWithTypes:(NSTextCheckingTypes)NSTextCheckingTypeLink
                                                                   error:nil];
    
    NSArray *matches = [linkDetector matchesInString:self.string
                                             options:0
                                               range:NSMakeRange(0, stringLength)];
    for (NSTextCheckingResult *match in matches)
    {
        if ([match resultType] == NSTextCheckingTypeLink)
        {
            NSDictionary *linkAttributes;
            NSURL *url = [NSURL URLWithString:[self.string substringWithRange:match.range]];
            
            linkAttributes = @{NSLinkAttributeName : url,
                               NSUnderlineStyleAttributeName : @(NSNoUnderlineStyle),
                               NSForegroundColorAttributeName : NSKitTextStorageLinkColor};
            
            [self addAttributes:linkAttributes range:match.range];
        }
    }
    
    [self endEditing];
}


@end
