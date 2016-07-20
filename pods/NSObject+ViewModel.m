//
//  NSObject+ViewModel.m
//  pods
//
//  Created by Edward on 16/6/30.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "NSObject+ViewModel.h"
//通过运行时，解决Category不能定义属性的弱点
#import <objc/runtime.h>
//dataTaskKey变量存的是他自己的地址，因为是静态的，所以地址不会有重复
static const void *dataTaskKey = &dataTaskKey;

@implementation NSObject (ViewModel)
- (void)setDataTask:(NSURLSessionDataTask *)dataTask{
    //参数4:属性的内存管理方式
    objc_setAssociatedObject(self, dataTaskKey, dataTask, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSURLSessionDataTask *)dataTask{
    return objc_getAssociatedObject(self, dataTaskKey);
}

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{

}

- (void)getDataCompletionHandler:(void(^)(NSError *error))completionHandler{

}

- (void)resumeTask{
    [self.dataTask resume];
}

- (void)cancelTask{
    [self.dataTask cancel];
}

- (void)suspendTask{
    [self.dataTask suspend];
}
@end
