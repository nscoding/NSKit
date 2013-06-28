//
//  NSKitInternetDoctor.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/28/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//

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
