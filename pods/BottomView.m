//
//  BottomView.m
//  pods
//
//  Created by Edward on 16/7/20.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView
- (instancetype)init{
    if (self = [super init]) {
         [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self photoImageView];
    [self songLabel];
    [self animationView];
    [self singerLabel];
}

- (UIImageView *)photoImageView {
    if(_photoImageView == nil) {
        _photoImageView = [[UIImageView alloc] init];
        [_photoImageView setImageWithURL:self.imageURL placeholderImage:[UIImage imageNamed:@"changpian"]];
        [self addSubview:_photoImageView];
        [_photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(1);
            make.bottom.equalTo(-1);
            make.width.equalTo(42);
        }];
    }
    return _photoImageView;
}

- (UILabel *)songLabel {
    if(_songLabel == nil) {
        _songLabel = [[UILabel alloc] init];
        [self addSubview:_songLabel];
        _songLabel.font = [UIFont systemFontOfSize:20];
        [_songLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.top.equalTo(1);
            make.width.equalTo(kScreenW/2);
            make.height.equalTo(20);
        }];
        _songLabel.text = @"暂无电台";
    }
    return _songLabel;
}

- (UILabel *)singerLabel {
    if(_singerLabel == nil) {
        _singerLabel = [[UILabel alloc] init];
        [self addSubview:_singerLabel];
        _singerLabel.font = [UIFont systemFontOfSize:15];
        [_singerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.top.equalTo(1);
            make.width.equalTo(kScreenW/2);
            make.height.equalTo(15);
        }];
        _singerLabel.text = @"暂无主播";
        _singerLabel.textColor = [UIColor lightGrayColor];
    }
    return _singerLabel;
}

- (UIImageView *)animationView {
    if(_animationView == nil) {
        _animationView = [[UIImageView alloc] init];
        [self addSubview:_animationView];
        [_animationView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(1);
            make.width.equalTo(42);
            make.right.bottom.equalTo(-1);
        }];
        if (!_isPlay) {
             _animationView.image = [UIImage imageNamed:@"playlLine"];
        }else{
            _animationView.image = [UIImage animatedImageNamed:@"line" duration:0.5];
        }
    }
    return _animationView;
}

+ (BottomView *)sharedBottomView{
    static BottomView *bottomView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bottomView = [[BottomView alloc] init];
    });
    return bottomView;
}

- (AVPlayer *)player {
    if(_player == nil) {
        _player = [AVPlayerController sharedAVPlayer];
    }
    return _player;
}

@end
