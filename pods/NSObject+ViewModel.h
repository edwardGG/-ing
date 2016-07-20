//
//  NSObject+ViewModel.h
//  pods
//
//  Created by Edward on 16/6/30.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh,
    RequestModeMore,
};
@interface NSObject (ViewModel)

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;

- (void)getDataCompletionHandler:(void(^)(NSError *error))completionHandler;



//用于保存当前网络请求任务
@property (nonatomic) NSURLSessionDataTask *dataTask;
//取消任务
- (void)cancelTask;

//暂停任务
- (void)suspendTask;

//继续任务
- (void)resumeTask;
@end
