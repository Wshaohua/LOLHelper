//
//  ZBItemDetailViewController.h
//  BaseProject
//
//  Created by tarenaFate on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBItemModel.h"

@interface ZBItemDetailViewController : UIViewController
- (id)initWithItemModelID:(ZBItemModel *)itemModel;
@property(nonatomic,strong)ZBItemModel *itemModel;
@end
