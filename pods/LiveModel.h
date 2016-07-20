//
//  LiveModel.h
//  pods
//
//  Created by Edward on 16/7/1.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "BaseModel.h"

@class LiveResultModel,LiveRecommandradiolistModel,LiveRadioplayurlModel,LiveTopradiolistModel,LiveRadioplayurlTwoModel;
@interface LiveModel : BaseModel

@property (nonatomic, copy) NSString *ret;

@property (nonatomic, strong) LiveResultModel *result;

@property (nonatomic, copy) NSString *msg;

@end

@interface LiveResultModel : NSObject

@property (nonatomic, strong) NSArray<LiveRecommandradiolistModel *> *recommandRadioList;

@property (nonatomic, strong) NSArray<LiveTopradiolistModel *> *topRadioList;

@end

@interface LiveRecommandradiolistModel : NSObject

@property (nonatomic, copy) NSString *picPath;

@property (nonatomic, assign) NSInteger radioPlayCount;

@property (nonatomic, strong) LiveRadioplayurlModel *radioPlayUrl;

@property (nonatomic, copy) NSString *rname;

@property (nonatomic, assign) NSInteger radioId;

@end

@interface LiveRadioplayurlModel : NSObject

@property (nonatomic, copy) NSString *radio_24_ts;

@property (nonatomic, copy) NSString *radio_64_aac;

@property (nonatomic, copy) NSString *radio_24_aac;

@property (nonatomic, copy) NSString *radio_64_ts;

@end

@interface LiveTopradiolistModel : NSObject

@property (nonatomic, assign) NSInteger radioPlayCount;

@property (nonatomic, copy) NSString *rname;

@property (nonatomic, copy) NSString *radioCoverLarge;

@property (nonatomic, assign) NSInteger programScheduleId;

@property (nonatomic, assign) NSInteger radioId;

@property (nonatomic, strong) LiveRadioplayurlTwoModel *radioPlayUrl;

@property (nonatomic, copy) NSString *programName;

@property (nonatomic, assign) NSInteger programId;

@property (nonatomic, copy) NSString *radioCoverSmall;

@end

@interface LiveRadioplayurlTwoModel : NSObject

@property (nonatomic, copy) NSString *radio_24_ts;

@property (nonatomic, copy) NSString *radio_64_aac;

@property (nonatomic, copy) NSString *radio_24_aac;

@property (nonatomic, copy) NSString *radio_64_ts;

@end

