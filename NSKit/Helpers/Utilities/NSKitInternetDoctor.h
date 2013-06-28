//
//  NSKitInternetDoctor.h
//  NSKit
//
//  Created by Patrick Chamelo on 6/28/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//

/**
 Holds a reference to the default URL to ping.
 */
extern NSString *NSKitPingURL;

@interface NSKitInternetDoctor : NSObject

/**
 * Is connected.
 * @discussion
 * This property will inform you if you are connected to the internet or not.
 *
 */
@property (nonatomic, assign) BOOL connected;


/**
 * Singleton, class method to receive back the singleton reference.
 */
+ (NSKitInternetDoctor *)shared;


/**
 * Method to retry pinging the given server.
 */
- (void)retry;

@end
