//
//  AppDelegate.m
//  pods
//
//  Created by Edward on 16/6/30.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "AppDelegate.h"
#import "LiveNetManage.h"
#import "ViewController.h"
@interface AppDelegate ()


@end

@implementation AppDelegate

- (UIWindow *)window {
    if(_window == nil) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor whiteColor];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [LiveNetManage getLiveDataCompletionHandler:^(id model, NSError *error) {
//        NSLog(@"a");
//    }];
//    [LiveNetManage getTopListProgramScheduleId:45779 radioId:1065 completionHandler:^(id model, NSError *error) {
//        NSLog(@"1");
//    }];

    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    navi.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:28],NSForegroundColorAttributeName:[UIColor blackColor]};
    [navi.navigationBar setBackgroundImage:[UIImage imageNamed:@"top"] forBarPosition:UIBarPositionTop barMetrics:UIBarMetricsDefault];
    navi.navigationBar.translucent = NO;
    _window.rootViewController = navi;
//    [self playerBtn];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (UIButton *)playerBtn {
	if(_playerBtn == nil) {
		_playerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_playerBtn setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        
         [_playerBtn setBackgroundImage:[UIImage imageNamed:@"music88"] forState:UIControlStateSelected];
        [_playerBtn setSelected:NO];
        [_window addSubview:_playerBtn];
        [_playerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(0);
            make.centerX.equalTo(self.window.mas_centerX);
            make.size.equalTo(CGSizeMake(45, 45));
        }];
        [_playerBtn addTarget:self action:@selector(playRadio) forControlEvents:UIControlEventTouchUpInside];
	}
	return _playerBtn;
}

- (void)playRadio{
    _playerBtn.selected = !_playerBtn.selected;
}

@end
