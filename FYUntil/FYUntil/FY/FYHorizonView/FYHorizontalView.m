//
//  FYHorizontalView.m
//  模板
//
//  Created by mac on 2017/12/5.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FYHorizontalView.h"
#import "FYHorizontailCollectionViewCell.h"

static NSString *cellIdentifer = @"horizontalViewCell";

@interface FYHorizontalView () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation FYHorizontalView

#pragma mark - init
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self commentInit];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commentInit];
    }
    return self;
}

- (void)commentInit
{
    self.isShowAccess = NO;
    self.selectColor = [UIColor colorWithRed:0.95 green:0.15 blue:0.13 alpha:1.00];
    self.normalColor = [UIColor colorWithRed:0.09 green:0.11 blue:0.15 alpha:1.00];
    self.selectIndex = 0;
    self.showSlideView = YES;
    [self addSubview:self.collectionView];
    [self addSubview:self.slideView];
}

#pragma mark - get
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[FYHorizontailCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifer];
    }
    return _collectionView;
}

- (UIView *)slideView
{
    if (!_slideView) {
        _slideView = [[UIView alloc] init];
        _slideView.backgroundColor = self.selectColor;
    }
    return _slideView;
}

- (RACSubject *)menuClickSubject
{
    if (!_menuClickSubject) {
        _menuClickSubject = [[RACSubject alloc] init];
    }
    return _menuClickSubject;
}

#pragma mark - set
- (void)setIsShowAccess:(BOOL)isShowAccess
{
    if (_isShowAccess != isShowAccess) {
        _isShowAccess = isShowAccess;
        
        [self.collectionView reloadData];
    }
}

- (void)setShowSlideView:(BOOL)showSlideView
{
    if (_showSlideView != showSlideView) {
        _showSlideView = showSlideView;
        
        if (_showSlideView) {
            self.slideView.hidden = NO;
        } else {
            self.slideView.hidden = YES;
        }
    }
}

- (void)setSelectIndex:(NSInteger)selectIndex
{
    _selectIndex = selectIndex;
    
    [self.collectionView reloadData];
}

#pragma mark - collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.menuArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    FYHorizontailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifer forIndexPath:indexPath];
    if (self.selectIndex == indexPath.row) {
        cell.isSelect = YES;
    } else {
        cell.isSelect = NO;
    }
    cell.titleLabel.text = self.menuArray[indexPath.row];
    cell.isShowAccess = self.isShowAccess;
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectIndex = indexPath.row;
    FYHorizontailCollectionViewCell *cell = (FYHorizontailCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [[NSNotificationCenter defaultCenter] postNotificationName:ChangeHorizontailCellSelectStyleNotification object:cell];
    [self.menuClickSubject sendNext:@(self.selectIndex)];
    [self setNeedsLayout];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = self.bounds.size.width / self.menuArray.count;
    return CGSizeMake(width, self.bounds.size.height);
}

#pragma mark - layout
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width / self.menuArray.count;
    CGFloat slideWidth = 13;
    CGFloat x = (width - slideWidth) / 2.0 + width * self.selectIndex;
    CGFloat height = 3;
    self.slideView.frame = CGRectMake(x, self.bounds.size.height - height, slideWidth, height);
}

@end
