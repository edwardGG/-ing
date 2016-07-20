//
//  LiveViewModel.h
//  pods
//
//  Created by Edward on 16/7/5.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "BaseViewModel.h"
#import "TopListModel.h"
@interface LiveViewModel : BaseViewModel
#pragma 推荐电台中间3个cell
//返回多少个行
@property (nonatomic) NSInteger rowNumber;
//存储数据的数组
@property (nonatomic) NSArray *recommandRadio;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)rnameForRow:(NSInteger)row;
//背景图片
- (NSURL *)picPathURLForRow:(NSInteger)row;
//音频的URL
- (NSURL *)radioURLForRow:(NSInteger)row;

//- (NSInteger)radioIdForRow:(NSInteger)row;
//- (NSInteger)programIdForRow:(NSInteger)row;


#pragma 排行榜
//返回多少行
@property (nonatomic) NSInteger topRowNumber;
//存储排行榜数据的数据
@property (nonatomic) NSArray *topArray;
//图片的url
- (NSURL *)topIconURLForRow:(NSInteger)row;
//大题目
- (NSString *)topRnameForRow:(NSInteger)row;
//小题目
- (NSString *)programNameForRow:(NSInteger)row;
//收听人数
- (NSString *)playcountForRow:(NSInteger)row;
//radioId
- (NSInteger)radioIdForRow:(NSInteger)row;
//programId
- (NSInteger)programIdForRow:(NSInteger)row;
//TopRadioURL
- (NSURL *)topRadioURLForRow:(NSInteger)row;
@end
