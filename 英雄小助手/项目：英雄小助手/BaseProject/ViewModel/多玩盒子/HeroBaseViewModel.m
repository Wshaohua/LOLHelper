//
//  HeroBaseViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroBaseViewModel.h"
#import "AllHeroModel.h"
@implementation HeroBaseViewModel
- (id)initWithTag:(NSString *)tag{
    if (self = [super init]) {
        self.tag = tag;
    }
    return self;
}
- (NSInteger)rowNumber{
    return self.dataArr.count;
}


-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getHeroWithType:HeroTypeAll completionHandle:^(AllHeroModel *model, NSError *error) {
        if (!error) {
            [self.dataArr addObjectsFromArray:model.all];
        }
        completionHandle(error);
    }];
}

- (AllHeroAllModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSString *)itemNameForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", [self modelForRow:row].enName]];
}


@end
