//
//  NSObject+AFNetwork.h
//  pods
//
//  Created by Edward on 16/6/30.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

#define kCompeltionHandlerBlock (void(^)(id model, NSError *error))completionHandler;
//定义一个block类型
typedef void(^CompeltionHandlerBlock)(id model, NSError *error);

@interface NSObject (AFNetwork)

+ (id)GET:(NSString *)path parameters:(id)parameters progress:(void(^)(NSProgress *downloadProgress))downloadProgress completionHandler:kCompeltionHandlerBlock

+ (id)POST:(NSString *)path parameters:(id)parameters progress:(void(^)(NSProgress *downloadProgress))downloadProgress completionHandler:kCompeltionHandlerBlock

@end
