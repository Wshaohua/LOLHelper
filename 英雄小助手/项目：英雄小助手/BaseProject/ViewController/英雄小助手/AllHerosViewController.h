//
//  AllHerosViewController.h
//  BaseProject
//
//  Created by tarenaFate on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllHerosViewController : UIViewController
+ (UINavigationController *)defaultNavi;

- (id)initWithTag:(NSString *)tag name:(NSString *)name;
@property(nonatomic,strong) NSString *tag;

@end
