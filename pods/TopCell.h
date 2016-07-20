//
//  TopCell.h
//  pods
//
//  Created by Edward on 16/7/2.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *topImage;
@property (weak, nonatomic) IBOutlet UILabel *bigTitle;
@property (weak, nonatomic) IBOutlet UILabel *centerTitle;
@property (weak, nonatomic) IBOutlet UILabel *playCount;

@end
