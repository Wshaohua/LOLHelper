//
//  XiaoZhuShouTabBarController.m
//  BaseProject
//
//  Created by tarenaFate on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiaoZhuShouTabBarController.h"
#import "AllHerosViewController.h"
#import "SearchViewController.h"
#import "ZBCategoryViewController.h"

@interface XiaoZhuShouTabBarController ()
@end

@implementation XiaoZhuShouTabBarController

+ (XiaoZhuShouTabBarController *)standardInstance
{
    static XiaoZhuShouTabBarController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        vc = [XiaoZhuShouTabBarController new];
    });
    return vc;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    //取消工具栏的透明状态
    //self.tabBar.translucent = NO;
    //初始化三个子视图，放到tabBar中
    AllHerosViewController *heroVC = [AllHerosViewController new];
    SearchViewController *searchVC = [SearchViewController new];
    ZBCategoryViewController *ZBCateVC = [ZBCategoryViewController new];
    UINavigationController *heroNavi = [[UINavigationController alloc]initWithRootViewController:heroVC];
    UINavigationController *CategoryNavi = [[UINavigationController alloc]initWithRootViewController:ZBCateVC];
    UINavigationController *searchNavi = [[UINavigationController alloc]initWithRootViewController:searchVC];
    self.viewControllers = @[heroNavi,CategoryNavi,searchNavi];
    //self.tabBar.backgroundImage = [UIImage imageNamed:@"account_button"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
