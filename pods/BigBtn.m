//
//  BigBtn.m
//  pods
//
//  Created by Edward on 16/7/3.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "BigBtn.h"

@implementation BigBtn

- (instancetype)initWithFrame:(CGRect)frame Image:(NSString *)img {
    if (self = [super initWithFrame:frame]) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setBackgroundImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
        [self addSubview:_btn];
        _btn.frame = frame;
        self.layer.cornerRadius = frame.size.width/2;
        _btn.layer.cornerRadius = frame.size.width/2;
        _btn.clipsToBounds = YES;
        self.clipsToBounds = YES;
    }
    return self;
}

@end
