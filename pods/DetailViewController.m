//
//  DetailViewController.m
//  pods
//
//  Created by Edward on 16/7/12.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailViewModel.h"
#import "AppDelegate.h"
#import "TopListModel.h"
#import "AVPlayerController.h"

@interface DetailViewController ()
@property (nonatomic) AVPlayerItem *playerItem;
@property (nonatomic) AVPlayer *player;
@property (nonatomic) CABasicAnimation *animation;//圆盘的转动动画

@end

@implementation DetailViewController

- (IBAction)playOrPause:(UIButton *)sender {
//     [self centerImageRotate];
    //判断之前是否在播放
    if (self.player.currentItem) {
        //替换
        [self.player replaceCurrentItemWithPlayerItem:self.playerItem];
      [self centerImageRotate];
//      [self resumeLayer:self.centerImage.layer];
    }else{
        //创建
        self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
        [self centerImageRotate];
//        [self resumeLayer:self.centerImage.layer];
    }
    [self.player play];
    if (sender.selected) {
       [self.player pause];
        [self stopAnimationZ];
//        [self pauseLayer:self.centerImage.layer];
    }
    sender.selected = !sender.selected;
}

//-(void)pauseLayer:(CALayer*)layer
//{
//    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
//    layer.speed = 0.0;
//    layer.timeOffset = pausedTime;
//}
//
//-(void)resumeLayer:(CALayer*)layer
//{
//    CFTimeInterval pausedTime = [layer timeOffset];
//    layer.speed = 1.0;
//    layer.timeOffset = 0.0;
//    layer.beginTime = 0.0;
//    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
//    layer.beginTime = timeSincePause;
//}

- (void)centerImageRotate{
    _animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    _animation.toValue = @(- M_PI * 2);
    _animation.duration = 10;
    _animation.repeatCount = MAXFLOAT;
    [self.centerImage.layer addAnimation:_animation forKey:@"animaitonZ"];
}

- (void)stopAnimationZ{
    [self.centerImage.layer removeAnimationForKey:@"animaitonZ"];
}

- (IBAction)backLiveViewController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setCenterImageLayer];
    //网络请求加载数据
    [self.detailViewModel getDataCompletionHandler:^(NSError *error) {
        self.channelName.text = self.detailViewModel.naviName;
        self.startTime.text = self.detailViewModel.startTime;
        self.endTime.text = self.detailViewModel.endTime;
        if (self.detailViewModel.hostName.count == 0) {
            self.hostName.text = @"暂无主播";
        }else{
        NSString *tmpName = @"";
        for (TopAnnouncerlistModel *nameDic in self.detailViewModel.hostName) {
            NSString *tmpName2 = [NSString stringWithFormat:@"%@ %@",tmpName, nameDic.announcerName];
            tmpName = tmpName2;
        }
            self.hostName.text = [NSString stringWithFormat:@"主播：%@", tmpName];
        }
    }];
    [self.centerImage setImageWithURL:self.detailViewModel.centerImage];
    [self.progressSlider setThumbImage:[UIImage imageNamed:@"baiyuanquan"] forState:UIControlStateNormal];
}

//设置图片layer
- (void)setCenterImageLayer{
    self.centerImage.layer.cornerRadius = self.centerImage.bounds.size.width/2;
    self.centerImage.clipsToBounds = YES;
}

- (NSString *)description{
    NSString *desc = [NSString stringWithFormat:@"%@",self.hostName.text];
    return desc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DetailViewModel *)detailViewModel {
	if(_detailViewModel == nil) {
		_detailViewModel = [[DetailViewModel alloc] init];
	}
	return _detailViewModel;
}



- (AVPlayerItem *)playerItem {
	if(_playerItem == nil) {
        AVAsset *asset = [AVURLAsset URLAssetWithURL:self.radioURL options:nil];
		_playerItem = [AVPlayerItem playerItemWithAsset:asset];
	}
	return _playerItem;
}

- (AVPlayer *)player {
	if(_player == nil) {
		_player = [AVPlayerController sharedAVPlayer];
	}
	return _player;
}

@end
