//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "XiaoZhuShouTabBarController.h"
#import "LeftViewController.h"
#import <MLTransition.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
   
    self.window.rootViewController = self.sideMenu;
    [self configGlobalUIStyle];//配置全局样式
    
    
    return YES;
}

- (void)configGlobalUIStyle
{
    [[UINavigationBar appearance]setTranslucent:NO];
    
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:KNaviTitleFontSize],NSForegroundColorAttributeName:KNaviTitleColor}];
    [[UINavigationBar appearance]setBarTintColor:KNaviTintColor];
    /** 解决屏幕右滑失效问题 */
    [MLTransition validatePanPackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypeScreenEdgePan];


}

- (UIWindow *)window
{
    if (!_window)
    {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _window;
}

- (RESideMenu *)sideMenu
{
    if (!_sideMenu)
    {
        _sideMenu = [[RESideMenu alloc]initWithContentViewController:[XiaoZhuShouTabBarController standardInstance] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        _sideMenu.backgroundImage = [UIImage imageNamed:@"IMG_1372"];
        _sideMenu.bouncesHorizontally = NO;
        _sideMenu.menuPrefersStatusBarHidden = YES;
    }
    return _sideMenu;
}

@end
