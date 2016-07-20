//
//  SmallBtn.h
//  pods
//
//  Created by Edward on 16/7/3.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmallBtn : UIButton
- (instancetype)initWithFrame:(CGRect)frame Image:(NSString *)img;

@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, assign) CGPoint nearPoint;
@property (nonatomic, assign) CGPoint farPoint;
@end
