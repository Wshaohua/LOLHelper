//
//  ZBItemDetailViewModel.m
//  BaseProject
//
//  Created by tarenaFate on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBItemDetailViewModel.h"

@implementation ZBItemDetailViewModel

- (id)initWithItemID:(NSInteger)ItemID
{
    if (self = [super init])
    {
        self.ItemID = ItemID;
    }
    return self;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getItemDetailWithItemId:_ItemID completionHandle:^(ItemDetailModel *model, NSError *error)
    {
        if (!error)
        {
            [self.dataArr addObject:model];
        }
        completionHandle(error);
    }];
    
}

- (NSInteger)rowNumber
{
    return self.dataArr.count;
}

- (ItemDetailModel *)getDetail
{
    return self.dataArr.firstObject;
}
/** 物品价格 */
- (NSInteger)priceDetail
{
    return [self getDetail].price;
}
/** 物品总价 */
- (NSInteger)allPriceDetail
{
    return [self getDetail].allPrice;
}
/** 物品售价 */
- (NSInteger)sellPriceDetail
{
    return [self getDetail].sellPrice;
}
/** 物品id */
- (NSString *)IdDetail
{   //NSLog(@"AAAA %@",[self getDetail].ID);
    return [self getDetail].ID;
}
/** 物品标题 */
- (NSString *)titleDetail
{
    return [self getDetail].name;
}
/** 物品图片URL */
- (NSURL *)iconURLDetail
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",[self getDetail].ID]];
}
/** 物品属性 */
- (NSString *)internalBaseClassDescriptionDetail
{
    return [self getDetail].internalBaseClassDescription;
}
- (NSString *)extDescDetail
{
    return [self getDetail].extDesc;
}
/** 合成需求 */
- (NSArray *)needArr
{
    NSString *str = [self getDetail].need;
    NSArray *needArr = [str componentsSeparatedByString:@","];
    for (int i = 0; i<[needArr count]; i++)
    {
        str = needArr[i];
    }
    return needArr;
}
- (NSInteger) needNum
{
    return self.needArr.count;
}
/** 可合成 */
- (NSArray *)composeArr
{
    NSString *Str = [self getDetail].compose;
    NSArray *composeArr = [Str componentsSeparatedByString:@","];
    for (int i = 0; i <[composeArr count]; i++)
    {
        Str = composeArr[i];
    }
    return composeArr;
}

- (NSInteger)composeNum
{
    return self.composeArr.count;
}
@end
