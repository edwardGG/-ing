//
//  BaseModel.m
//  pods
//
//  Created by Edward on 16/7/1.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
MJCodingImplementation

+ (NSString *)replacedKeyFromPropertyName:(NSString *)propertyName{
    //统一变化
    if ([propertyName isEqualToString:@"ID"])
        propertyName = @"id";
    
    if ([propertyName isEqualToString:@"desc"]) propertyName = @"description";
    return [propertyName mj_underlineFromCamel];
}
@end
