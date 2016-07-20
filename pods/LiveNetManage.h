//
//  LiveNetManage.h
//  pods
//
//  Created by Edward on 16/7/1.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiveModel.h"
#import "NSObject+AFNetwork.h"

@interface LiveNetManage : NSObject
//直播第一页的网络请求
+ (id)getLiveDataCompletionHandler:kCompeltionHandlerBlock

//直播详情页的网络请求
+ (id)getTopListProgramScheduleId:(NSInteger)programScheduleId radioId:(NSInteger)radioId completionHandler:kCompeltionHandlerBlock
@end
