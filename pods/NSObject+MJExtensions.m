//
//  NSObject+MJExtensions.m
//  pods
//
//  Created by Edward on 16/6/30.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "NSObject+MJExtensions.h"

@implementation NSObject (MJExtensions)
+ (id)parse:(id)responseObj{
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:responseObj];
    }
    return responseObj;
}

+ (NSDictionary *)mj_objectClassInArray{
    return [self objClassInArray];
}

+ (NSDictionary *)objClassInArray{
    return nil;
}

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [self replacedKeyFromPropertyName:propertyName];
}

+ (NSString *)replacedKeyFromPropertyName:(NSString *)propertyName{
    return propertyName;
}
@end
