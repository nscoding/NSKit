//
//  NSKitInternetDoctor.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/28/13.
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



#import "NSKitInternetDoctor.h"
#import "Reachability.h"


// ------------------------------------------------------------------------------------------


NSString *NSKitPingURL;


// ------------------------------------------------------------------------------------------


@interface NSKitInternetDoctor()

@property (nonatomic, strong) Reachability *kitReachability;

- (void)buildAndConfigure;

@end


// ------------------------------------------------------------------------------------------


@implementation NSKitInternetDoctor


// ------------------------------------------------------------------------------------------
#pragma mark - Singleton
// ------------------------------------------------------------------------------------------
+ (NSKitInternetDoctor *)shared
{
    static dispatch_once_t pred;
    static NSKitInternetDoctor *shared = nil;
    
    dispatch_once(&pred, ^()
    {
        shared = [[NSKitInternetDoctor alloc] init];
    });
    
    return shared;
}


// ------------------------------------------------------------------------------------------
#pragma mark - Constructor
// ------------------------------------------------------------------------------------------
- (id)init
{
    if ((self = [super init]))
    {
        [self buildAndConfigure];
    }
    
    return self;
}


// ------------------------------------------------------------------------------------------
#pragma mark - Build and Configure
// ------------------------------------------------------------------------------------------
- (void)buildAndConfigure
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    self.connected = YES;
    
    [self pingServer];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Actions
// ------------------------------------------------------------------------------------------
- (void)pingServer
{
    if (NSKitPingURL.length == 0)
    {
        @throw [NSException exceptionWithName:@"NSKitPingURLMissing"
                                       reason:@"Pease set the NSKitPingURL to your ping URL"
                                     userInfo:nil];
    }
    
    self.kitReachability = [Reachability reachabilityWithHostname:NSKitPingURL];
    
    __unsafe_unretained NSKitInternetDoctor *blockSelf = self;
    
    self.kitReachability.reachableBlock = ^(Reachability *reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            blockSelf.connected = YES;
        });
    };
    
    self.kitReachability.unreachableBlock = ^(Reachability *reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            blockSelf.connected = NO;
        });
    };
    
    [self.kitReachability startNotifier];
}


- (void)retry
{
    [self.kitReachability stopNotifier];
    [self.kitReachability startNotifier];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Reachability notifications
// ------------------------------------------------------------------------------------------
- (void)reachabilityChanged:(NSNotification*)notification
{
    Reachability *reach = [notification object];
    if (reach == self.kitReachability)
    {
        self.connected = [reach isReachable];
    }
}


@end
