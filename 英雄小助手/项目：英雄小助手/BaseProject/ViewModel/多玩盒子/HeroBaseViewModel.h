//
//  HeroBaseViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface HeroBaseViewModel : BaseViewModel
- (id)initWithTag:(NSString *)tag;
@property(nonatomic,strong) NSString *tag;


@property(nonatomic) NSInteger rowNumber;

-(AllHeroAllModel *)modelForRow:(NSInteger)row;
- (NSString *)itemNameForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row;

@end
