//
//  SmallBtn.m
//  pods
//
//  Created by Edward on 16/7/3.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "SmallBtn.h"

@implementation SmallBtn

- (instancetype)initWithFrame:(CGRect)frame Image:(NSString *)img{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

@end
