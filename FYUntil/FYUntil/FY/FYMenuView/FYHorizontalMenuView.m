//
//  FYHorizontalMenuView.m
//  模板
//
//  Created by mac on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FYHorizontalMenuView.h"
#import <Masonry/Masonry.h>
#import "FYMenuCell.h"

@interface FYHorizontalMenuView () <FYMenuCellDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
//@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) NSArray *collectionViewSource;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

static NSString *identifier = @"fyHorizontalMenu";

@implementation FYHorizontalMenuView

#pragma mark - lazy
- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    }
    return _pageControl;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.directionalLockEnabled = YES;
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[FYMenuCell class] forCellWithReuseIdentifier:identifier];
    }
    return _collectionView;
}

#pragma mark - set
- (void)setMenuBackgroupColor:(UIColor *)menuBackgroupColor
{
    _menuBackgroupColor = menuBackgroupColor;
    
    self.collectionView.backgroundColor = menuBackgroupColor;
}

- (void)setDataSource:(NSArray<FYHorizontalMenuData *> *)dataSource
{
    if (_dataSource != dataSource) {
        _dataSource = dataSource;
        
        [self setUpData];
        [self.collectionView reloadData];
    }
}

- (void)setNumberOfEachPage:(NSInteger)numberOfEachPage
{
    if (_numberOfEachPage != numberOfEachPage) {
        _numberOfEachPage = numberOfEachPage;
        
        [self setUpData];
        [self.collectionView reloadData];
    }
}

- (void)setFooterView:(UIView *)footerView
{
    self.showPageController = NO;
    _footerView = footerView;
    [self addSubview:footerView];
}

- (void)setShowPageController:(BOOL)showPageController
{
    _showPageController = showPageController;
    
    if (_showPageController) {
        self.pageControl.hidden = NO;
    } else {
        self.pageControl.hidden = YES;
    }
}



#pragma mark - collectionView代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count / self.numberOfEachPage + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FYMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.dataSource = self.collectionViewSource[indexPath.row];
    cell.delegate = self;
    cell.itemSize = self.itemSize;
    cell.paddingLeft = self.paddingLeft;
    cell.paddingTop = self.paddingTop;
    cell.numberOfEachPage = self.numberOfEachPage;
    cell.backgroundColor = self.menuBackgroupColor ? self.menuBackgroupColor : [UIColor whiteColor];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.bounds.size.width, self.bounds.size.height);
}

#pragma mark - scrollView代理
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = (scrollView.contentOffset.x + 1) / self.collectionView.frame.size.width;
    self.pageControl.currentPage = page;
}

#pragma mark - menuView代理
- (void)menuView:(FYMenuCell *)view DidClickIndex:(NSInteger)index
{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(didClickMenuAtIndex:)]) {
            NSIndexPath *indexPath = [self.collectionView indexPathForCell:view];
            [self.delegate didClickMenuAtIndex:index + indexPath.row * self.numberOfEachPage];
        }
    }
}

#pragma mark - init
- (instancetype)initWithDataSource:(NSArray<FYHorizontalMenuData *> *)dataSource
                    WithPageNumber:(NSInteger)number
{
    self = [super init];
    if (self) {
        self.numberOfEachPage = number;
        self.dataSource = [dataSource copy];
        [self setUpData];
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
               WithDataSource:(NSArray<FYHorizontalMenuData *> *)dataSource
               WithPageNumber:(NSInteger)number
{
    self = [super initWithFrame:frame];
    if (self) {
        self.numberOfEachPage = number;
        self.dataSource = [dataSource copy];
        [self setUpData];
        [self setupUI];
    }
    return self;
}

#pragma mark - function
- (void)setUpData
{
    if (!self.dataSource) {
        return;
    }
    
    NSInteger count = self.dataSource.count / self.numberOfEachPage + 1;
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i++) {
        if (i == count - 1) {
            [array addObject:[self.dataSource subarrayWithRange:NSMakeRange(self.numberOfEachPage * i, self.dataSource.count - self.numberOfEachPage * i)]];
        } else {
            [array addObject:[self.dataSource subarrayWithRange:NSMakeRange(self.numberOfEachPage * i, self.numberOfEachPage)]];
        }
    }
    self.collectionViewSource = [NSArray arrayWithArray:array];
    
    //计算 pagecontrol数量 
    self.pageControl.numberOfPages = self.dataSource.count / self.numberOfEachPage + 1;
}

- (void)setupUI
{
    self.showPageController = YES;
    [self addSubview:self.collectionView];
    [self addSubview:self.pageControl];
}


- (void)show
{
    [self.collectionView reloadData];
}


#pragma mark - layout
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
        make.center.equalTo(self);
    }];
    
    if (self.showPageController) {
        [self.pageControl mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.centerX.equalTo(self);
            make.height.mas_equalTo(30);
        }];
    }
    
    if (self.footerView) {
        [self.footerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.centerX.equalTo(self);
            make.height.mas_equalTo(30);
        }];
    }
}


@end


#pragma mark - FYHorizontalMenuData

@implementation FYHorizontalMenuData

- (FYHorizontalMenuData *)initWithTitel:(NSString *)titel
                                     ImgUrl:(NSString *)imgUrl
{
    if (self = [super init]) {
        self.title = [titel copy];
        self.imgUrl = [imgUrl copy];
    }
    return self;
}


@end
