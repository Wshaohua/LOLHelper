//
//  HeroDetailViewModel.m
//  BaseProject
//
//  Created by tarenaFate on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroDetailViewModel.h"


@implementation HeroDetailViewModel
- (id)initWithEnName:(NSString *)enName
{
    if (self = [super init])
    {
        self.enName = enName;
    }
    return self;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getHeroDetailWithHeroName:_enName completionHandle:^(id model, NSError *error)
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
- (HeroDetailModel *)model
{
    return self.dataArr.firstObject;
}

- (NSURL *)iconForRow
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self model].name]];
}
- (NSString *)titleForRow
{
    return [self model].title;
}
- (NSString *)tagsForRow
{
    return [self model].tags;
}
- (NSString *)priceTitleForRow
{
    return [self model].price;
}

- (NSString *)ratingAttackForRow;
{
    return [self model].ratingAttack;
}
- (NSString *)ratingDefenseForRow
{
    return [self model].ratingDefense;
}
- (NSString *)ratingMagicForRow
{
    return [self model].ratingMagic;
}
- (NSString *)ratingDiffultyForRow
{
    return [self model].ratingDifficulty;
}
//使用技巧
- (NSString *)tipsForRow
{
    return [self model].tips;
}
//应对技巧
- (NSString *)oppoentTipsForRow
{
    return [self model].opponentTips;
}
//英雄背景
- (NSString *)descForRow
{
    return [self model].desc;
}

/** 最佳搭档 */

- (NSArray *)likeForRow
{
    return [self model].like;
}

- (NSString *)partner1ForRow
{
    HeroDetailLikeModel *model = [self likeForRow].firstObject;
    return model.partner;
}

- (NSString *)des1ForRow
{
    HeroDetailLikeModel *model = [self likeForRow].firstObject;
    return model.des;
}
/** 最佳克制 */
- (NSArray *)hateForRow
{
    return [self model].hate;
}

- (NSString *)partnerForRow
{
    HeroDetailHateModel *model = [self hateForRow].firstObject;
    return model.partner;
}

- (NSString *)desForRow
{
    HeroDetailHateModel *model = [self hateForRow].firstObject;
    return model.des;
}

@end
