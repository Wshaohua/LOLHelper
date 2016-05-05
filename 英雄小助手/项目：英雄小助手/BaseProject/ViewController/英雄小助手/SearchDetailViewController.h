//
//  SearchDetailViewController.h
//  BaseProject
//
//  Created by tarenaFate on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDetailViewController : UIViewController
- (id)initWithRequest:(NSURLRequest *)request;
@property(nonatomic,strong) NSURLRequest *request;

@end
