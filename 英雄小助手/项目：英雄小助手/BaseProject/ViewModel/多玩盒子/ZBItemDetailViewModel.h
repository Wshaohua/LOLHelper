//
//  ZBItemDetailViewModel.h
//  BaseProject
//
//  Created by tarenaFate on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

@interface ZBItemDetailViewModel : BaseViewModel
- (ItemDetailModel *)getDetail;

- (id)initWithItemID:(NSInteger)ItemID;
@property(nonatomic,assign)NSInteger ItemID;
@property(nonatomic,assign)NSInteger rowNumber;

/** 合成需求的图片数组*/
@property(nonatomic,strong)NSArray *needArr;
/** 合成需求的图片数组数量 */
@property(nonatomic)NSInteger needNum;
/** 可合成的图片数组 */
@property(nonatomic,strong)NSArray *composeArr;
/** 可合成的图片数组数量 */
@property(nonatomic)NSInteger composeNum;
/** 物品价格 */
- (NSInteger)priceDetail;
/** 物品总价 */
- (NSInteger)allPriceDetail;
/** 物品售价 */
- (NSInteger)sellPriceDetail;
/** 物品id */
- (NSString *)IdDetail;
/** 物品标题 */
- (NSString *)titleDetail;
/** 物品图片URL */
- (NSURL *)iconURLDetail;
/** 物品属性 */
- (NSString *)internalBaseClassDescriptionDetail;
- (NSString *)extDescDetail;
/** 合成需求 */
- (NSArray *)needArr;
- (NSInteger) needNum;
/** 可合成 */
- (NSArray *)composeArr;
- (NSInteger)composeNum;
/** tag值 */
- (NSString *)tagsDetail;
@end
