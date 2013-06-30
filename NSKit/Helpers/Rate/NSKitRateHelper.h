//
//  NSKitRateHelper.h
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

/**
 * Holds a reference to the appstore URL.
 * e.g.  NSKitAppStoreURL = @"macappstore://itunes.apple.com/app/id641027709?mt=12";
 */
extern NSString *NSKitAppStoreURL;


/**
 * Holds a reference to the rate title string.
 * e.g. NSLocalizedString(@"Rate and Review Color Picker", @"");
 */
extern NSString *NSKitRateTitleText;


/**
 * Holds a reference to the rate description string.
 * e.g. NSLocalizedString(@"If you enjoy using Color Picker, "
 *                        @"would you mind taking a moment to rate it? "
 *                        @"It won't take more than a minute. Thanks for your support!", @"")
 */
extern NSString *NSKitRateDescriptionText;


/**
 * Holds a reference to the rate now button string.
 * e.g. NSLocalizedString(@"Rate Now", @"");
 */
extern NSString *NSKitRateNowButtonText;


/**
 * Holds a reference to the rate later button string.
 * e.g. NSLocalizedString(@"Later", @"");
 */
extern NSString *NSKitRateLaterButtonText;


/**
 * Holds a reference to the rate no thanks button string.
 * e.g. NSLocalizedString(@"No Thanks", @"");
 */
extern NSString *NSKitRateNoThanksButtonText;


/**
 * Holds a reference to the minimum number of usages before prompting.
 * if is less than zero ( < 0) then is ignored. Default value is 2.
 */
extern NSInteger NSKitRateMinimumUsages;

/**
 * Holds a reference to the minimum number of days before prompting.
 * if is less than zero ( < 0) then is ignored.  Default value is 10.
 */
extern NSInteger NSKitRateMinimumDays;

/**
 * Holds a reference to the minimum number of significant events before prompting.
 * if is less than zero ( < 0) then is ignored. Default value is 0.
 */
extern NSInteger NSKitRateMinimumSignificantEvents;


/**
 * A utility that reminds your users to review the app.
 */
@interface NSKitRateHelper : NSObject


/**
 * NSKit rate object to store the rate information.
 * Usage: Just invoke [[NSKitRateHelper shared] applicationDidFinishLaunch]
 * when your application is finishing launching.
 *
 * You can also call [[NSKitRateHelper shared] performedSignigicantEvent] 
 * to increase the count of the significant events in case you want to bring
 * up the rate dialog after the user has performed some actions.
 *
 */
@property (nonatomic, strong) NSKitRate *rate;


/**
 * Singleton implementation for the rate helper.
 */
+ (NSKitRateHelper *)shared;

/**
 * This method should be called in your applicationDidFinishLaunching notification
 * to inform the Rate helper that app is launched.
 */
- (void)applicationDidFinishLaunch;


/**
 * This method should be called when you want to bring the rate me dialog after some
 * significant events. e.g. NSKitRateMinimumSignificantEvents = 10; the user must
 * perform 10 events to get the rate dialog.
 */
- (void)performedSignigicantEvent;


@end
