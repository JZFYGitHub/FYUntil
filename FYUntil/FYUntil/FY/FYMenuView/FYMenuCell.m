//
//  FYMenuCell.m
//  模板
//
//  Created by mac on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FYMenuCell.h"
#import "FYHorizontalMenuView.h"
#import "FYMenuViewCollectionViewCell.h"
#import <Masonry/Masonry.h>
#import <ReactiveCocoa.h>
@interface FYMenuCell () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;

@end


static NSString *identifier = @"fymenuView";

@implementation FYMenuCell

#pragma mark - lazy
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[FYMenuViewCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    }
    return _collectionView;
}


#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
    }
    return self;
}

#pragma mark - set
- (void)setDataSource:(NSArray<FYHorizontalMenuData *> *)dataSource
{
    _dataSource = [dataSource copy];
    
    [self.collectionView reloadData];
}

- (void)setPaddingTop:(CGFloat)paddingTop
{
    _paddingTop = paddingTop;
    
    [self.collectionView reloadData];
}

- (void)setPaddingLeft:(CGFloat)paddingLeft
{
    _paddingLeft = paddingLeft;
    
    [self.collectionView reloadData];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    
    self.collectionView.backgroundColor = backgroundColor;
}

#pragma mark - collection代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FYMenuViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.data = self.dataSource[indexPath.row];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.itemSize.width < 1) {
        return CGSizeMake(80, 100);
    }
    return self.itemSize;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(menuView:DidClickIndex:)]) {
            [self.delegate menuView:self DidClickIndex:indexPath.row];
        }
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat spacing = ([UIScreen mainScreen].bounds.size.width - 2 * self.paddingLeft - self.numberOfEachPage * self.itemSize.width) / (self.numberOfEachPage - 1) - .1;
    return spacing;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(self.paddingTop, self.paddingLeft, self.paddingTop, self.paddingLeft);
}

#pragma mark - layout
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.equalTo(self);
    }];
}



@end
