//
//  ZBItemDetailModel.m
//  BaseProject
//
//  Created by tarenaFate on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBItemDetailModel.h"

@implementation ZBItemDetailModel

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID":@"id",@"desc":@"description"};
}

@end
