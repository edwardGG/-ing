//
//  LiveViewModel.m
//  pods
//
//  Created by Edward on 16/7/5.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "LiveViewModel.h"

@implementation LiveViewModel
#pragma 推荐
//返回多少个行
- (NSInteger)rowNumber{
    return self.recommandRadio.count;
}

//存储数据的数组
- (NSArray *)recommandRadio{
    if (!_recommandRadio) {
        _recommandRadio = [[NSArray alloc] init];
    }
    return _recommandRadio;
}

- (LiveRecommandradiolistModel *)modelForRow:(NSInteger)row{
    return self.recommandRadio[row];
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].picPath];
}

- (NSString *)rnameForRow:(NSInteger)row{
    return [self modelForRow:row].rname;
}

//背景图片
- (NSURL *)picPathURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].picPath];
}
//音频的URL
- (NSURL *)radioURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].radioPlayUrl.radio_24_ts];
}

- (void)getDataCompletionHandler:(void (^)(NSError *))completionHandler{
     self.dataTask = [LiveNetManage getLiveDataCompletionHandler:^(LiveModel *model, NSError *error) {
         if (!error) {
             self.recommandRadio = model.result.recommandRadioList;
             self.topArray = model.result.topRadioList;
             
             
             /*所有类型是LiveModel类型的, 样式一致
              通过runtime获取属性, 查看属性数组中的元素是什么类型
              */
             unsigned int outCount = 0;
             Ivar *varList = class_copyIvarList([model class], &outCount);
             NSMutableArray *tmpList = [NSMutableArray new];
             for (int i = 0; i < outCount; i++) {
                 Ivar ivar = varList[i];
                 const char *name = ivar_getName(ivar);
                 NSString *propertyName = [[NSString alloc] initWithUTF8String:name];
                 id obj = [model valueForKey:propertyName];
                 if ([obj isKindOfClass:[NSArray class]]) {
                     id firstObj = [(NSArray *)obj firstObject];
                     if ([firstObj isKindOfClass:[LiveModel class]]) {
                         [tmpList addObject:obj];
                     }
                 }else{
                     NSLog(@"error %@", error);
                 }
             }
             }
             completionHandler(error);
         }];
}

#pragma 排行榜
//返回多少行
- (NSInteger)topRowNumber{
    return self.topArray.count;
}
//存储排行榜数据的数据
- (NSArray *)topArray{
    if (!_topArray) {
        _topArray = [[NSArray alloc] init];
    }
    return _topArray;
}

//返回这种类型的数据
- (LiveTopradiolistModel *)topModelForRow:(NSInteger)row{
    return self.topArray[row];
}

//图片的url
- (NSURL *)topIconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self topModelForRow:row].radioCoverLarge];
}
//大题目
- (NSString *)topRnameForRow:(NSInteger)row{
    return [self topModelForRow:row].rname;
}
//小题目
- (NSString *)programNameForRow:(NSInteger)row{
    return [self topModelForRow:row].programName;
}
//收听人数
- (NSString *)playcountForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"收听人数:%.1lf万人",(double)[self topModelForRow:row].radioPlayCount/10000];
}
//radioId
- (NSInteger)radioIdForRow:(NSInteger)row{
    return [self topModelForRow:row].radioId;
}
//programId
- (NSInteger)programIdForRow:(NSInteger)row{
    return [self topModelForRow:row].programId;
}

- (NSURL *)topRadioURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self topModelForRow:row].radioPlayUrl.radio_24_ts];
}
@end
