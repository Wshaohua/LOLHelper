//
//  HeroDetailViewModel.h
//  BaseProject
//
//  Created by tarenaFate on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

//做宏
#define kIconPathWithEnName(enName)  [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", enName]

@interface HeroDetailViewModel : BaseViewModel
- (id)initWithEnName:(NSString *)enName;
@property(nonatomic,strong)NSString *enName;

@property(nonatomic,assign)NSInteger rowNumber;

- (NSURL *)iconForRow;
- (NSString *)titleForRow;
- (NSString *)tagsForRow;
- (NSString *)priceTitleForRow;

- (NSString *)ratingAttackForRow;
- (NSString *)ratingDefenseForRow;
- (NSString *)ratingMagicForRow;
- (NSString *)ratingDiffultyForRow;

//使用技巧
- (NSString *)tipsForRow;
//应对技巧
- (NSString *)oppoentTipsForRow;
//英雄背景
- (NSString *)descForRow;

//最佳搭档
- (NSArray *)likeForRow;
- (NSString *)partner1ForRow;
- (NSString *)des1ForRow;
//最佳克制
- (NSArray *)hateForRow;
- (NSString *)partnerForRow;
- (NSString *)desForRow;
@end
