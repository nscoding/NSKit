//
//  NSKitMemoryHelper.m
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


#import "NSKitMemoryHelper.h"
#import <mach/mach.h>
#import <mach/mach_host.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#include <stdio.h>
#include <stdlib.h>


@implementation NSKitMemoryHelper


+ (NSUInteger)memoryForOption:(NSKitMemoryOption)option
{
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
	
    vm_statistics_data_t vm_stat;
	
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS)
        NSLog(@"Failed to fetch vm statistics");
	
    natural_t count;
    
    switch (option)
    {
        case NSKitMemoryOptionFree:
        {
            count = vm_stat.free_count;
        }
            break;
        case NSKitMemoryOptionInactive:
        {
            count = vm_stat.inactive_count;
        }
            break;
        case NSKitMemoryOptionActive:
        {
            count = vm_stat.active_count;
        }
            break;
        case NSKitMemoryOptionWired:
        {
            count = vm_stat.wire_count;
        }
            break;
        case NSKitMemoryOptionAll:
        {
            count = vm_stat.free_count + vm_stat.inactive_count +
            vm_stat.active_count + vm_stat.wire_count;
        }
            break;
    }
    
	return ((NSUInteger) count * pagesize);
}


+ (NSString *)stringMemoryForOption:(NSKitMemoryOption)option
{
    return [NSString stringWithFormat:@"%.2lu MB",
            [NSKitMemoryHelper memoryForOption:option] / 1024 / 1024];
}


@end
