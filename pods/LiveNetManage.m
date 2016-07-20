//
//  LiveNetManage.m
//  pods
//
//  Created by Edward on 16/7/1.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "LiveNetManage.h"
#import "TopListModel.h"
#define kTopListPath @"http://live.ximalaya.com/live-web/v1/getProgramDetail?device=iPhone&programScheduleId=%ld&radioId=%ld"
@implementation LiveNetManage
+ (id)getLiveDataCompletionHandler:(void (^)(id, NSError *))completionHandler{
    NSLog(@"%@",kLivePath);
    return [self GET:kLivePath parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([LiveModel parse:responseObj], error);
    }];
}

+ (id)getTopListProgramScheduleId:(NSInteger)programScheduleId radioId:(NSInteger)radioId completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kTopListPath,programScheduleId, radioId];
       NSLog(@"%@",path);
    return [self GET:path parameters:nil progress:nil completionHandler:^(id model, NSError *error) {
         completionHandler([TopListModel parse:model], error);
    }];

}



@end
