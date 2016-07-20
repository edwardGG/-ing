//
//  TopCell.m
//  pods
//
//  Created by Edward on 16/7/2.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "TopCell.h"

@implementation TopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.topImage.layer.borderColor = kRGBA(236, 240, 241, 0.5).CGColor;
    self.topImage.layer.borderWidth = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
