//
//  NSKitPerformanceTimer.m
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


#import "NSKitPerformanceTimer.h"
#include <mach/mach.h>
#include <mach/mach_time.h>


@interface NSKitPerformanceTimer()
{
	double timer;
    uint64_t startTime;
}

@end


@implementation NSKitPerformanceTimer


- (id)init
{
	if ((self = [super init]))
	{		
		mach_timebase_info_data_t info;
		mach_timebase_info(&info);
		timer = (double)info.numer / ((double)info.denom * 1000000.0);
    }
    
    return self;
}


- (void)fire
{
    startTime = mach_absolute_time();
}


- (void)logResult
{
    double milliseconds = (mach_absolute_time() - startTime) * timer;
    NSString *loggedResult = [NSString stringWithFormat:@"Time: %.1f milliseconds", milliseconds];
   
    NSLog(@"%@",loggedResult);
}


@end
