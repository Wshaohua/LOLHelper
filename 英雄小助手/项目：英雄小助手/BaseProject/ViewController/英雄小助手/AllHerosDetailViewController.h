//
//  AllHerosDetailViewController.h
//  BaseProject
//
//  Created by tarenaFate on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllHeroModel.h"

@interface AllHerosDetailViewController : UIViewController
-(id)initWithHeroModel:(AllHeroAllModel *)heroModel;
@property(nonatomic,strong)AllHeroAllModel *heroModel;

@end
