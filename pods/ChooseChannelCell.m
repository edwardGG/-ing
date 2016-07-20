//
//  ChooseChannelCell.m
//  pods
//
//  Created by Edward on 16/7/3.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "ChooseChannelCell.h"

@implementation ChooseChannelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.chooseChannelV.layer.borderColor = kRGBA(236, 240, 241, 0.5).CGColor;
    self.chooseChannelV.layer.borderWidth = 1;
}



@end
