//
//  DetailViewModel.h
//  pods
//
//  Created by Edward on 16/7/12.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "BaseViewModel.h"
#import "TopListModel.h"

@interface DetailViewModel : BaseViewModel
#pragma 排行详情页
//导航的标题
@property (nonatomic) NSString *naviName;
//radioID
@property (nonatomic) NSInteger radioId;
//programID
@property (nonatomic) NSInteger programId;
//开始时间
@property (nonatomic) NSString *startTime;
//结束时间
@property (nonatomic) NSString *endTime;
//主持人名字
@property (nonatomic) NSArray *hostName;
////音频的URL
//@property (nonatomic) NSURL *radioURL;
@property (nonatomic) NSURL *centerImage;


@end
