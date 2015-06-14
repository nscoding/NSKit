//
//  NSKitRateHelper.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/30/13.
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


#import "NSKitRateHelper.h"
#import "NSUserDefaults+NSKitExtensions.h"

NSString *NSKitAppStoreURL;
NSString *NSKitRateTitleText;
NSString *NSKitRateDescriptionText;
NSString *NSKitRateNowButtonText;
NSString *NSKitRateLaterButtonText;
NSString *NSKitRateNoThanksButtonText;
NSInteger NSKitRateMinimumUsages = 2;
NSInteger NSKitRateMinimumDays = 10;
NSInteger NSKitRateMinimumSignificantEvents;

@implementation NSKitRateHelper

#pragma mark - Singleton

+ (NSKitRateHelper *)shared
{
    static dispatch_once_t pred;
    static NSKitRateHelper *shared = nil;
    dispatch_once(&pred, ^(){
        shared = [[NSKitRateHelper alloc] init];
    });
    
    return shared;
}


- (instancetype)init
{
    if (self = [super init])
    {
        if (NSKitAppStoreURL.length == 0 ||
            NSKitRateTitleText.length == 0 ||
            NSKitRateDescriptionText.length == 0 ||
            NSKitRateNowButtonText.length == 0 ||
            NSKitRateLaterButtonText.length == 0 ||
            NSKitRateNoThanksButtonText.length == 0){
            @throw [NSException exceptionWithName:@"NSKitRateHelper is not configured"
                                           reason:@"Please popuate the references"
                                         userInfo:nil];
        }
        
        NSString *majorBundleVersion =
        [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        
        if (majorBundleVersion.length < 4)
        {
            @throw [NSException exceptionWithName:@"Invalid short version string"
                                           reason:@"The CFBundleShortVersionString shoud be "
                                                  @"more than 3 characters, e.g. 1.1.0 "
                                                  @"to find out the major versions."
                                         userInfo:nil];
        }

    }

    return self;
}

#pragma mark - Helpers

- (void)showAlertIfNeeded:(BOOL)onLaunch
{
    if ([self needsToShowAlert:onLaunch]){
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:NSKitRateTitleText];
        [alert setInformativeText:NSKitRateDescriptionText];
        [alert addButtonWithTitle:NSKitRateNowButtonText];
        [alert addButtonWithTitle:NSKitRateLaterButtonText];
        [alert addButtonWithTitle:NSKitRateNoThanksButtonText];
        [alert setAlertStyle:NSInformationalAlertStyle];
        [alert beginSheetModalForWindow:nil
                          modalDelegate:self
                         didEndSelector:@selector(reteAlertDidEnd:returnCode:contextInfo:)
                            contextInfo:nil];
    }
}


- (BOOL)needsToShowAlert:(BOOL)onLaunch
{
    [self loadRate];
    // if the object is nil
    if (self.rate == nil){
        self.rate = [[NSKitRate alloc] init];
        self.rate.significantEvents = 0;
        self.rate.lastDateAsked = nil;
        self.rate.doneAlready = NO;
        self.rate.majorBundleVerion = nil;
        self.rate.numberOfUsages = 0;
        [self saveRate];
    }
    
    [self loadRate];
    
    if (self.rate){
        NSString *majorBundleVersion =
        [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];        
        majorBundleVersion = [majorBundleVersion substringWithRange:NSMakeRange(0, 4)];

        if ([self.rate.majorBundleVerion isEqualToString:majorBundleVersion] == NO){
            // set the engaged to no
            self.rate.majorBundleVerion = majorBundleVersion;
            self.rate.doneAlready = NO;
            self.rate.numberOfUsages = 1;
            self.rate.significantEvents = 0;
            self.rate.lastDateAsked = nil;
            
            [self saveRate];
            
            return NO;
        }
        
        if (onLaunch){
            self.rate.numberOfUsages += 1;
            [self saveRate];
        }
        
        if (self.rate.lastDateAsked == nil){
            if (self.rate.significantEvents >= NSKitRateMinimumSignificantEvents &&
                self.rate.numberOfUsages >= NSKitRateMinimumUsages &&
                self.rate.doneAlready == NO){
                return YES;
            }
            return NO;
        }
        
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *components = [calendar
                                        components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
                                        fromDate:self.rate.lastDateAsked
                                        toDate:[NSDate date]
                                        options:0];
        
        if (self.rate.significantEvents >= NSKitRateMinimumSignificantEvents &&
            self.rate.numberOfUsages >= NSKitRateMinimumUsages &&
            self.rate.doneAlready == NO  && components.day >= NSKitRateMinimumDays){
            return YES;
        }
        [self saveRate];
    }
    
    return NO;
}


- (void)reteAlertDidEnd:(NSAlert *)alert
             returnCode:(NSInteger)returnCode
            contextInfo:(void *)contextInfo
{
    if (returnCode == NSAlertFirstButtonReturn){
        self.rate.doneAlready = YES;
        [self rateApp];
    } else if (returnCode == NSAlertSecondButtonReturn){
        self.rate.doneAlready = NO;
    } else if (returnCode == NSAlertThirdButtonReturn){
        self.rate.doneAlready = YES;
    }
    self.rate.lastDateAsked = [NSDate date];
    [self saveRate];
}


- (void)rateApp
{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:NSKitAppStoreURL]];
}

#pragma mark - Methods

- (void)performedSignigicantEvent
{
    [self loadRate];
    self.rate.significantEvents += 1;
    
    [self saveRate];
    [self showAlertIfNeeded:NO];
}

- (void)applicationDidFinishLaunch
{
    [self showAlertIfNeeded:YES];
}

#pragma mark - Save / Load

- (void)saveRate
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.rate];
    [NSUserDefaults nskit_setValue:data forKey:@"NSKitApplicationRateMeObject"];
}

- (void)loadRate
{
    NSData *data = [NSUserDefaults nskit_valueForKey:@"NSKitApplicationRateMeObject"];
    if (data){
        self.rate = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
}

@end
