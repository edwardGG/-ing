//
//  AVPlayerController.m
//  pods
//
//  Created by Edward on 16/7/19.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "AVPlayerController.h"

@implementation AVPlayerController
+ (AVPlayer *)sharedAVPlayer{
    static AVPlayer *player = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        player = [AVPlayer playerWithPlayerItem:playerItem];
        player = [[AVPlayer alloc] init];
    });
    return player;
}

//+ (instancetype)sharedAVPlayer{
//    static AVPlayerController *player = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        player = [[AVPlayerController alloc] init];
//    });
//    return player;
//}
//
//- (instancetype)init{
//    if (self = [super init]) {
//        AVPlayer *player = [AVPlayer pl]
//    }
//}
@end
