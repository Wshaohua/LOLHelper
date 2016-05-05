//
//  ZBItemDetailModel.h
//  BaseProject
//
//  Created by tarenaFate on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//@class ExtattrsModel;

@interface ZBItemDetailModel : BaseModel

//@property (nonatomic, strong) ExtattrsModel *extAttrs;
//
//@property (nonatomic, copy) NSString *need;
//
//@property (nonatomic, copy) NSString *ID;
//
//@property (nonatomic, assign) NSInteger price;
//
//@property (nonatomic, assign) NSInteger allPrice;
//
//@property (nonatomic, assign) NSInteger sellPrice;
//
//@property (nonatomic, copy) NSString *compose;
//
//@property (nonatomic, copy) NSString *extDesc;
//
//@property (nonatomic, copy) NSString *desc;
//
//@property (nonatomic, copy) NSString *name;
//
//@property (nonatomic, copy) NSString *tags;
//
//@end
//
//@interface ExtattrsModel : BaseModel
//
//@property (nonatomic, assign) NSInteger flatMPPoolMod;
//
//@property (nonatomic, assign) NSInteger flatPhysicalDamageMod;
//
//@property (nonatomic, assign) CGFloat fercentBaseMPRegenMod;
//




@property (nonatomic, strong) NSArray *extAttrs;
@property (nonatomic, strong) NSString *need;
@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, assign) double allPrice;
@property (nonatomic, assign) double sellPrice;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *compose;
@property (nonatomic, strong) NSString *extDesc;
@property (nonatomic, strong) NSString *internalBaseClassDescription;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *tags;


@end


