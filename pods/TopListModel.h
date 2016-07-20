//
//  TopListModel.h
//  pods
//
//  Created by Edward on 16/7/6.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "BaseModel.h"

@class TopResultModel,TopAnnouncerlistModel;
@interface TopListModel : BaseModel

@property (nonatomic, copy) NSString *ret;

@property (nonatomic, strong) TopResultModel *result;

@property (nonatomic, copy) NSString *msg;

@end
@interface TopResultModel : NSObject

@property (nonatomic, copy) NSString *startTime;

@property (nonatomic, copy) NSString *endTime;

@property (nonatomic, copy) NSString *playBackgroundPic;

@property (nonatomic, strong) NSArray<TopAnnouncerlistModel *> *announcerList;

@property (nonatomic, assign) NSInteger programScheduleId;

@property (nonatomic, assign) NSInteger fmuid;

@property (nonatomic, assign) NSInteger programId;

@property (nonatomic, copy) NSString *programName;

@end

@interface TopAnnouncerlistModel : NSObject

@property (nonatomic, assign) NSInteger announcerId;

@property (nonatomic, copy) NSString *announcerName;

@end

