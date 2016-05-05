//
//  AllHerosDetailViewController.m
//  BaseProject
//
//  Created by tarenaFate on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AllHerosDetailViewController.h"
#import "TRImageView.h"
#import "HeroDetailViewModel.h"
#import "Factory.h"

@interface HeroDetailCell : UITableViewCell
@property(nonatomic,strong)UILabel *descLb;
@end
@implementation HeroDetailCell

- (UILabel *)descLb
{
    if (_descLb == nil)
    {
        _descLb = [[UILabel alloc]init];
        _descLb.font = [UIFont systemFontOfSize:13];
        UIView *redView = [UIView new];
        redView.backgroundColor=[UIColor redColor];
        [self.contentView addSubview:redView];
        redView.layer.cornerRadius = 4;
        [redView mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.edges.mas_equalTo(UIEdgeInsetsMake(3, 10, 3, 10));
        }];
        
        UIView *whiteView =[UIView new];
        whiteView.backgroundColor = [UIColor whiteColor];
        [redView addSubview:whiteView];
        whiteView.layer.cornerRadius = 4;
        
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.edges.mas_equalTo(UIEdgeInsetsMake(1, 1, 1, 1));
            make.height.mas_greaterThanOrEqualTo(28);
        }];
        
        [whiteView addSubview:_descLb];
        _descLb.numberOfLines = 0;
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
        
    }
    return _descLb;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
@end


@interface AllHerosDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)HeroDetailViewModel *heroDetailVM;
@property(nonatomic,strong)UIView *topView;

@end

@implementation AllHerosDetailViewController
-(id)initWithHeroModel:(AllHeroAllModel *)heroModel
{
    if (self = [super init])
    {
        self.heroModel = heroModel;
        self.title = heroModel.cnName;
        [Factory addBackItemToVC:self];
    }
    return self;
}

- (HeroDetailViewModel *)heroDetailVM
{
    if(_heroDetailVM == nil)
    {
        _heroDetailVM = [[HeroDetailViewModel alloc] initWithEnName:self.heroModel.enName];
    }
    return _heroDetailVM;
}

- (UITableView *)tableView
{
    if(_tableView == nil)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.allowsSelection = NO;
        _tableView.separatorStyle = 0;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.left.bottom.right.mas_equalTo(0);
            make.top.mas_equalTo(self.topView.mas_bottom).mas_equalTo(0);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^
        {
            [self.heroDetailVM getDataFromNetCompleteHandle:^(NSError *error)
            {
                if (error)
                {
                    [self showErrorMsg:error.localizedDescription];
                }else
                {
                    [_tableView.header endRefreshing];
                }
                [_tableView reloadData];
            }];
        }];
        [_tableView registerClass:[HeroDetailCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}

- (UIView *)topView
{
    if(_topView == nil)
    {
        _topView = [[UIView alloc] init];
        [self.view addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(90);
        }];
        
        //英雄头像
        TRImageView *imageView = [TRImageView new];
        [_topView addSubview:imageView];
        NSURL *iconURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_heroModel.enName]];
        [imageView.imageView setImageWithURL:iconURL placeholderImage:[UIImage imageNamed:@"account_mars_default"]];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.left.top.mas_equalTo(8);
        }];
        
        //英雄名称
        UILabel *nameLb = [UILabel new];
        nameLb.text = _heroModel.cnName;
        nameLb.font = [UIFont boldFlatFontOfSize:15];
        [_topView addSubview:nameLb];
        [nameLb mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(imageView);
        }];
        
        //英雄标签
        UILabel *textLb = [UILabel new];
        textLb.text = [self.heroDetailVM tagsForRow];
        [_topView addSubview:textLb];
        [textLb mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.left.mas_equalTo(nameLb.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(nameLb);
        }];
        
        //需要金币
        //需要得到英雄详情解析出得字符串
        UILabel *priceLb = [UILabel new];
        NSArray *arr = [self.heroModel.price componentsSeparatedByString:@","];
        NSString *m1 = arr.firstObject;
        NSString *m2 = arr.lastObject;
        priceLb.text = [NSString stringWithFormat:@"金%@,券%@",m1,m2];
        priceLb.textColor = [UIColor lightGrayColor];
        [_topView addSubview:priceLb];
        [priceLb mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.leftMargin.rightMargin.mas_equalTo(nameLb);
            make.top.mas_equalTo(nameLb.mas_bottom).mas_equalTo(5);
        }];
        
        //英雄系数
        UILabel *coolLb = [UILabel new];
        NSArray *arr2 = [self.heroModel.rating componentsSeparatedByString:@","];
        coolLb.text = [NSString stringWithFormat:@"攻%@ 防%@ 法%@ 难度%@",arr2[0],arr2[1],arr2[2],arr2[3]];
        coolLb.font = [UIFont systemFontOfSize:13];
        coolLb.textColor = [UIColor lightGrayColor];
        [_topView addSubview:coolLb];
        [coolLb mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.leftMargin.rightMargin.mas_equalTo(nameLb);
            make.top.mas_equalTo(priceLb.mas_bottom).mas_equalTo(5);
        }];
    }
    return _topView;
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @[@"使用技巧", @"应对技巧", @"英雄背景",@"最佳搭档",@"最佳克制"][section];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeroDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (indexPath.section == 0)
    {
        cell.descLb.text = [_heroDetailVM oppoentTipsForRow];
    }
    if (indexPath.section == 1)
    {
        cell.descLb.text = [_heroDetailVM tipsForRow];
    }
    if (indexPath.section == 2)
    {
        cell.descLb.text = [_heroDetailVM descForRow];
    }
    if (indexPath.section == 3) {
        cell.descLb.text = [_heroDetailVM des1ForRow];
    }
    if (indexPath.section == 4) {
        cell.descLb.text = [_heroDetailVM desForRow];
    }
    return cell;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView.header beginRefreshing];
    self.view.backgroundColor = kRGBColor(246, 274, 251);
}

@end
