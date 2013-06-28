//
//  NSKitEmailHelper.m
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


#import "NSKitEmailHelper.h"
#import "NSKitUtilities.h"


// ------------------------------------------------------------------------------------------


@implementation NSKitEmailHelper


// ------------------------------------------------------------------------------------------
#pragma mark - Methods
// ------------------------------------------------------------------------------------------
+ (void)sendEmailTo:(NSString *)email
            subject:(NSString *)subject
               body:(NSString *)body
{
    if ([NSKitUtilities isValidEmail:email] == NO)
    {
        return;
    }

    NSString *encodedSubject = [NSString stringWithFormat:@"subject=%@",
                                [subject stringByUrlEncoding]];
    
    NSString *encodedBody = [NSString stringWithFormat:@"body=%@",
                             [body stringByUrlEncoding]];
    
    NSString *encodedURLString = [NSString stringWithFormat:@"mailto:%@?%@&%@", email, encodedSubject, encodedBody];
    
    [[NSWorkspace sharedWorkspace] openURL:[[NSURL alloc]
                                            initWithString:[NSString stringWithFormat:@"%@",encodedURLString]]];
}


@end
