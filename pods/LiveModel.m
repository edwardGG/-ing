//
//  LiveModel.m
//  pods
//
//  Created by Edward on 16/7/1.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "LiveModel.h"

@implementation LiveModel

@end
@implementation LiveResultModel

+ (NSDictionary *)objectClassInArray{
    return @{@"recommandRadioList" : [LiveRecommandradiolistModel class], @"topRadioList" : [LiveTopradiolistModel class]};
}

@end


@implementation LiveRecommandradiolistModel

@end


@implementation LiveRadioplayurlModel

@end


@implementation LiveTopradiolistModel

@end


@implementation LiveRadioplayurlTwoModel

@end


