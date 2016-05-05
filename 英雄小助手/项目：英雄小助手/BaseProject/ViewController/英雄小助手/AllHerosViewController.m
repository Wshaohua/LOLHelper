//
//  AllHerosViewController.m
//  BaseProject
//
//  Created by tarenaFate on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AllHerosViewController.h"
#import "Factory.h"
#import "HeroBaseViewModel.h"
#import "TRImageView.h"
#import "AllHerosDetailViewController.h"

@interface HeroCell : UICollectionViewCell
@property(nonatomic,strong) TRImageView *iconView;
@property(nonatomic,strong) UILabel *nameLb;
@end
@implementation HeroCell

- (UILabel *)nameLb
{
    if(_nameLb == nil)
    {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont systemFontOfSize:11];
        _nameLb.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make)
        {
             make.left.bottom.right.mas_equalTo(0);
        }];
    }
    return _nameLb;
}

- (TRImageView *)iconView
{
    if(_iconView == nil)
    {
        _iconView = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(_iconView.mas_width);
        }];
    }
    return _iconView;
}
@end

@interface AllHerosViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) HeroBaseViewModel*heroVM;
@end

@implementation AllHerosViewController

+ (UINavigationController *)defaultNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        AllHerosViewController *vc = [[AllHerosViewController alloc]init];
        navi = [[UINavigationController alloc]
                initWithRootViewController:vc];
    });
    return navi;
}

- (id)initWithTag:(NSString *)tag name:(NSString *)name
{
    if (self = [super init])
    {
        self.tag = tag;
        self.title = name;
        [Factory addBackItemToVC:self];
    }
    return self;
}

- (id)init
{
    if (self = [super init])
    {
        self.tabBarItem.image = [UIImage imageNamed:@"tab_btn_nor0"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_btn_sel0"];
    }
    return self;
}

- (HeroBaseViewModel *)heroVM
{
    if(_heroVM == nil)
    {
        _heroVM = [[HeroBaseViewModel alloc] initWithTag:_tag];
    }
    return _heroVM;
}

- (UICollectionView *)collectionView
{
    if(_collectionView == nil)
    {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^
        {
            [self.heroVM getDataFromNetCompleteHandle:^(NSError *error)
            {
                if (error)
                {
                    [self showErrorMsg:error.localizedDescription];
                }else
                {
                    [_collectionView reloadData];
                }
                [_collectionView.header endRefreshing];
            }];
        }];
        [_collectionView registerClass:[HeroCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collectionView;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.heroVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeroCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconView.imageView setImageWithURL:[self.heroVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.nameLb.text = [self.heroVM itemNameForRow:indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDataDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    AllHerosDetailViewController *vc = [[AllHerosDetailViewController alloc]initWithHeroModel:[self.heroVM modelForRow:indexPath.row]];
    
   [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UICollectionViewDelegateFlowLayout
/** section的上下左右边距 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}

/** 最小行间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

/** 每格cell的 宽高 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (kWindowW - 5 * 20) / 4;
    CGFloat height = width + 17;
    return CGSizeMake(width, height);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"英雄列表";
    [Factory addMenuItemToVC:self];
    self.navigationController.navigationBar.barTintColor = KNaviTintColor;
    [self.collectionView.header beginRefreshing];
    
}

@end
