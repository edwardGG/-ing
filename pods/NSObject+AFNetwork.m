//
//  NSObject+AFNetwork.m
//  pods
//
//  Created by Edward on 16/6/30.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "NSObject+AFNetwork.h"

#define kPath @"http://live.ximalaya.com/live-web/v1/getHomePageRadiosList?device=iPhone%20HTTP"

@implementation NSObject (AFNetwork)
+ (id)GET:(NSString *)path parameters:(id)parameters progress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id, NSError *))completionHandler{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html" ,@"text/plain" ,@"text/json" ,@"text/javascript", @"application/json"]];
    manager.requestSerializer.timeoutInterval = 30;//响应时间
    return [manager GET:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil, error);
        NSLog(@"error %@", error);
    }];
}

+ (id)POST:(NSString *)path parameters:(id)parameters progress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id, NSError *))completionHandler{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json"]];
    manager.requestSerializer.timeoutInterval = 30;
    return [manager POST:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil, error);
        NSLog(@"error %@", error);
    }];
}
@end
