//
//  BottomView.h
//  pods
//
//  Created by Edward on 16/7/20.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVPlayerController.h"
@import AVFoundation;
@interface BottomView : UIView
#pragma 图片
//显示图片的imageView
@property (nonatomic) UIImageView *photoImageView;
//图片的url
@property (nonatomic) NSURL *imageURL;

#pragma 歌名
//歌名label
@property (nonatomic) UILabel *songLabel;
@property (nonatomic) NSString *songName;

#pragma 图片
//歌手label
@property (nonatomic) UILabel *singerLabel;
@property (nonatomic) NSString *singerName;

#pragma 图片
//播放音乐的动画
@property (nonatomic) UIImageView *animationView;
@property (nonatomic) BOOL isPlay;

//单例
+ (BottomView *)sharedBottomView;

//播放的player
@property (nonatomic) AVPlayer *player;



@end
