//
//  DetailViewController.h
//  pods
//
//  Created by Edward on 16/7/12.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewModel.h"
@interface DetailViewController : UIViewController
//频道的名字
@property (weak, nonatomic) IBOutlet UILabel *channelName;

//主播名字
@property (weak, nonatomic) IBOutlet UILabel *hostName;

//时长
@property (weak, nonatomic) IBOutlet UILabel *startAndEndTime;

//图片
@property (weak, nonatomic) IBOutlet UIImageView *centerImage;

//收藏按钮
@property (weak, nonatomic) IBOutlet UIButton *collectBtn;

//定时按钮
@property (weak, nonatomic) IBOutlet UIButton *timingBtn;

//分享按钮
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

//slider
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;

//开始时间label
@property (weak, nonatomic) IBOutlet UILabel *startTime;

//结束时间label
@property (weak, nonatomic) IBOutlet UILabel *endTime;

//后退按钮
@property (weak, nonatomic) IBOutlet UIButton *retreatBtn;

//暂停按钮
@property (weak, nonatomic) IBOutlet UIButton *pauseBtn;

//前进按钮
@property (weak, nonatomic) IBOutlet UIButton *goBtn;


@property (nonatomic) DetailViewModel *detailViewModel;
//播放的地址
@property (nonatomic) NSURL *radioURL;


@end
