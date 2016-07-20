//
//  NSObject+MJExtensions.h
//  pods
//
//  Created by Edward on 16/6/30.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>
@interface NSObject (MJExtensions)
+ (id)parse:(id)responseObj;
+ (NSDictionary *)objClassInArray;
//mj_replacedKeyFromproperyName121:和replaceKeyFromPropertyName方法有冲突，使用了前者，则后者失效，选择只是用前者来做key和属性名对应操作
+ (NSString *)replacedKeyFromPropertyName:(NSString *)propertyName;
@end
