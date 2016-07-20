//
//  SmallBtnAddBigBtnView.h
//  pods
//
//  Created by Edward on 16/7/3.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallBtn.h"
#import "BigBtn.h"
@interface SmallBtnAddBigBtnView : UIView

- (void)expend:(BOOL)isExpend;

@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) BigBtn *mainView;
@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGFloat endDistance;
@property (nonatomic) CGFloat nearDistance;
@property (nonatomic) CGFloat farDistance;

@property (nonatomic) BOOL isExpend;
@property (nonatomic) BOOL scale;
@end
