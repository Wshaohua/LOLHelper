//
//  BaseModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

MJCodingImplementation
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID":@"id",@"typeName":@"typename",@"desc":@"desciption"};
}
@end

