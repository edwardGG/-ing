//
//  recommandCollectionViewCell.m
//  pods
//
//  Created by Edward on 16/7/1.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "recommandCollectionViewCell.h"

@implementation recommandCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.recommandCellImage.layer.borderWidth = 3;
    self.recommandCellImage.layer.borderColor = kRGBA(236, 240, 241, 1).CGColor;
}

@end
