//
//  DetailViewModel.m
//  pods
//
//  Created by Edward on 16/7/12.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "DetailViewModel.h"

@implementation DetailViewModel
#pragma 排行详情页
- (void)getDataCompletionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [LiveNetManage getTopListProgramScheduleId:_programId radioId:_radioId completionHandler:^(TopListModel *model, NSError *error) {
        if (!error) {
            self.naviName = model.result.programName;
            self.startTime = model.result.startTime;
            self.endTime = model.result.endTime;
            self.hostName = model.result.announcerList;
            
        }
        completionHandler(error);
    }];
}
@end
