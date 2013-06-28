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

@property (nonatomic, assign) BOOL connected;

+ (NSKitInternetDoctor *)shared;

- (void)pingServer;
- (void)retry;

@end
