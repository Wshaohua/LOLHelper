//
//  SearchViewController.m
//  BaseProject
//
//  Created by tarenaFate on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchDetailViewController.h"
#import "Factory.h"

@interface SearchViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation SearchViewController
- (id)init
{
    if (self = [super init]) {
        self.title = @"战绩查询";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_btn_nor5"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_btn_sel5"];
    }
    return self;
}

- (UIWebView *)webView
{
    if (_webView == nil)
    {
        _webView = [[UIWebView alloc]init];
        [self.view addSubview:_webView];
        _webView.delegate = self;
        [_webView mas_makeConstraints:^(MASConstraintMaker *make)
         {
            make.edges.mas_equalTo(0);
        }];
    }
    return _webView;
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *path = @"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView";
    if (![request.URL.absoluteString isEqualToString:path])
    {
        SearchDetailViewController *vc = [[SearchDetailViewController alloc]initWithRequest:request];
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [self hideProgress];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *path = @"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView";
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
    self.navigationController.navigationBar.barTintColor = KNaviTintColor;
    [Factory addMenuItemToVC:self];
}


@end
