//
//  ZBItemDetailViewController.m
//  BaseProject
//
//  Created by tarenaFate on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBItemDetailViewController.h"
#import "TRImageView.h"
#import "Factory.h"
#import "ZBItemDetailViewModel.h"

@interface ZBItemDetailTopCell : UITableViewCell
@property(nonatomic,strong)TRImageView *iconImageView;
@property(nonatomic,strong)UILabel *ZBNameLb;
@property(nonatomic,strong)UILabel *priceLb;
@property(nonatomic,strong)UILabel *allPriceLb;
@property(nonatomic,strong)UILabel *sellPriceLb;
@end

@implementation ZBItemDetailTopCell

- (TRImageView *)iconImageView
{
    if (_iconImageView == nil)
    {
        _iconImageView = [[TRImageView alloc]init];
        [self.contentView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.left.mas_equalTo(18);
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _iconImageView;
}

- (UILabel *)priceLb
{
    if (_priceLb == nil)
    {
        _priceLb = [[UILabel alloc]init];
        _priceLb.font = [UIFont systemFontOfSize:10];
        _priceLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_priceLb];
        [_priceLb mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.top.mas_equalTo(self.ZBNameLb.mas_bottom).mas_equalTo(2);
            make.leftMargin.mas_equalTo(self.ZBNameLb);
        }];
    }
    return _priceLb;
}

- (UILabel *)allPriceLb
{
    if (_allPriceLb == nil)
    {
        _allPriceLb = [[UILabel alloc]init];
        _allPriceLb.font = [UIFont systemFontOfSize:10];
        _allPriceLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_allPriceLb];
        [_allPriceLb mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.left.mas_equalTo(self.priceLb.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(self.priceLb);
        }];
    }
    return _allPriceLb;
}

- (UILabel *)sellPriceLb
{
    if (_sellPriceLb == nil)
    {
        _sellPriceLb = [[UILabel alloc]init];
        _sellPriceLb.font = [UIFont systemFontOfSize:10];
        _sellPriceLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_sellPriceLb];
        [_sellPriceLb mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.left.mas_equalTo(self.allPriceLb.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(self.allPriceLb);
        }];
    }
    return _sellPriceLb;
}
- (UILabel *)ZBNameLb
{
    if (_ZBNameLb == nil)
    {
        _ZBNameLb = [UILabel new];
        _ZBNameLb.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_ZBNameLb];
        [_ZBNameLb mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.topMargin.mas_equalTo(self.iconImageView);
            make.left.mas_equalTo(self.iconImageView.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _ZBNameLb;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end

@interface ZBItemDetailCell : UITableViewCell
@property(nonatomic,strong)UILabel *descLb;
@end
@implementation ZBItemDetailCell
- (UILabel *)descLb
{
    if (_descLb == nil)
    {
        _descLb = [[UILabel alloc]init];
        _descLb.font = [UIFont systemFontOfSize:13];
        
        UIView *grayView = [UIView new];
        grayView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:grayView];
        grayView.layer.cornerRadius = 4;
        [grayView mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.edges.mas_equalTo(UIEdgeInsetsMake(3, 10, 3, 10));
        }];
        
        UIView *whiteView = [UIView new];
        whiteView.backgroundColor = [UIColor whiteColor];
        [grayView addSubview:whiteView];
        whiteView.layer.cornerRadius = 4;
        
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.edges.mas_equalTo(UIEdgeInsetsMake(1, 1, 1, 1));
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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
@end

@interface ZBItemDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)ZBItemDetailViewModel *ZBItemDetailVM;
@end

@implementation ZBItemDetailViewController

- (id)initWithItemModelID:(ZBItemModel *)itemModel
{
    if (self = [super init])
    {
        self.itemModel = itemModel;
        self.title = @"物品详情";
        [Factory addBackItemToVC:self];
    }
    return self;
}

- (ZBItemDetailViewModel *)ZBItemDetailVM
{
    if (_ZBItemDetailVM == nil)
    {
        _ZBItemDetailVM = [[ZBItemDetailViewModel alloc]initWithItemID:self.itemModel.ID];
    }
    return _ZBItemDetailVM;
}

- (UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.allowsSelection = NO;
        _tableView.separatorStyle = 0;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.ZBItemDetailVM getDataFromNetCompleteHandle:^(NSError *error)
            {
                if (error)
                {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView.header endRefreshing];
                }
                [_tableView reloadData];
            }];
        }];
        
        [_tableView registerClass:[ZBItemDetailCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[ZBItemDetailTopCell class] forCellReuseIdentifier:@"TopCell"];
    }
    return _tableView;
}


#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @[@" ",@"物品属性",@"合成需求"][section];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        ZBItemDetailTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopCell"];
        [cell.iconImageView.imageView setImageWithURL:[self.ZBItemDetailVM iconURLDetail]placeholderImage:[UIImage imageNamed:@"compose_toolbar_picture_os7"]];
        cell.ZBNameLb.text = [self.ZBItemDetailVM titleDetail];
        cell.priceLb.text = [NSString stringWithFormat:@"价格:%ld",[self.ZBItemDetailVM priceDetail]];
        cell.allPriceLb.text = [NSString stringWithFormat:@"总价:%ld",[self.ZBItemDetailVM allPriceDetail]];
        cell.sellPriceLb.text = [NSString stringWithFormat:@"售价:%ld",[self.ZBItemDetailVM sellPriceDetail]];
        return cell;
    }
    else if (indexPath.section == 1)
    {
        ZBItemDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        cell.descLb.text = [self.ZBItemDetailVM extDescDetail];
        return cell;
    }
    else
    {
        ZBItemDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        NSInteger needNum = self.ZBItemDetailVM.needNum;
        for (int i = 0; i<needNum; i++) {
            UIImageView *imageView = [[UIImageView alloc]init];
            [cell.descLb addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(40, 40));
                make.left.mas_equalTo(55*i);
                make.top.mas_equalTo(10);
                make.bottom.mas_equalTo(-10);
            }];
            id need = self.ZBItemDetailVM.needArr[i];
            NSString *str = [NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",need];
            NSURL *url = [NSURL URLWithString:str];
            [imageView setImageWithURL:url];
        }

        return cell;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = kRGBColor(246, 247, 251);
    [self.tableView.header beginRefreshing];
}

@end
