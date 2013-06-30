//
//  NSKitRate.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/30/13.
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


#import "NSKitRate.h"


// ------------------------------------------------------------------------------------------


@implementation NSKitRate


// ------------------------------------------------------------------------------------------
#pragma mark - Decoder, Encoder
// ------------------------------------------------------------------------------------------
-(id)initWithCoder:(NSCoder*)decoder
{
    if ((self = [super init]))
    {
        self.majorBundleVerion = [decoder decodeObjectForKey:@"NSKitMajorBundleVerion"];
        self.lastDateAsked = [decoder decodeObjectForKey:@"NSKitLastDateAsked"];
        self.doneAlready = [((NSNumber*)[decoder decodeObjectForKey:@"NSKitDoneAlready"]) integerValue];
        self.significantEvents = [((NSNumber*)[decoder decodeObjectForKey:@"NSKitSignificantEvents"]) integerValue];
        self.numberOfUsages = [((NSNumber*)[decoder decodeObjectForKey:@"NSKitNumberOfUsages"]) integerValue];
    }
    
    return self;
}


-(void)encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeObject:self.majorBundleVerion forKey:@"NSKitMajorBundleVerion"];
    [encoder encodeObject:self.lastDateAsked forKey:@"NSKitLastDateAsked"];
    [encoder encodeObject:[NSNumber numberWithInteger:self.doneAlready] forKey:@"NSKitDoneAlready"];
    [encoder encodeObject:[NSNumber numberWithInteger:self.significantEvents] forKey:@"NSKitSignificantEvents"];
    [encoder encodeObject:[NSNumber numberWithInteger:self.numberOfUsages] forKey:@"NSKitNumberOfUsages"];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Helpers
// ------------------------------------------------------------------------------------------
- (NSString *)description;
{
    return [NSString stringWithFormat:@"Version: %@\nLast dete asked: %@\nDone:%i\n"
            "Number of events: %li\nNumber of usages: %li\n",
            self.majorBundleVerion , self.lastDateAsked, self.doneAlready,
            self.significantEvents, self.numberOfUsages];
}


@end
