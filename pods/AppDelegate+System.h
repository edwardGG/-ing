//
//  AppDelegate+System.h
//  pods
//
//  Created by Edward on 16/6/30.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworkActivityIndicatorManager.h>
#import <AFNetworkReachabilityManager.h>
@interface AppDelegate (System)

- (void)setupGlobalConfig;

@property (nonatomic, readonly) AFNetworkReachabilityStatus netReachStatus;
@property (nonatomic,  readonly) BOOL onLine;

@end
