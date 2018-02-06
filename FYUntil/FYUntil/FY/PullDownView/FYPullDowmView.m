//
//  FYPullDowmView.m
//  kuaibang
//
//  Created by mac on 2017/12/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FYPullDowmView.h"
#import "MenuView.h"
#import "FYHorizontalView.h"
#import "UIView+Extension.h"

static NSInteger headerMenuHeight = 44;

@interface FYPullDowmView ()
/**
 下拉菜单
 */
@property (nonatomic, strong) MenuView *menuView;

/**
 选择菜单
 */
@property (nonatomic, strong) FYHorizontalView *menuheader;

@property (nonatomic, assign) NSInteger selectIndex;

@end

@implementation FYPullDowmView

#pragma mark - get
- (MenuView *)menuView
{
    if (!_menuView) {
        CGRect rect = CGRectMake(0, headerMenuHeight, self.width, self.superview.height - headerMenuHeight);
        CGRect menuRect = [self.superview convertRect:rect fromView:self];
        
        _menuView = [[MenuView alloc] initWithFrame:menuRect];
        @weakify(self)
        [[_menuView.clickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
            NSInteger row = [x integerValue];
            NSLog(@"%ld", row);
            @strongify(self)
            //修改选中记录值
            self.dataSource[self.selectIndex].selectIndex = row;
            self.menuheader.menuArray[self.selectIndex] = self.dataSource[self.selectIndex].array[row].name;
            [self.clickSubject sendNext:[NSIndexPath indexPathForRow:row inSection:self.selectIndex]];
        }];
        [[_menuView.dismissSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
            @strongify(self)
            [self endChouch];
        }];
        [self.superview addSubview:_menuView];
    }
    return _menuView;
}


- (FYHorizontalView *)menuheader
{
    if (!_menuheader) {
        _menuheader = [[FYHorizontalView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, headerMenuHeight)];
        _menuheader.showSlideView = NO;
        //取消默认选择
        _menuheader.selectIndex = -1;
        _menuheader.isShowAccess = YES;
        
        self.selectIndex = -1;
        @weakify(self)
        [[_menuheader.menuClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
            @strongify(self)
            NSInteger row = [x integerValue];
            if (row == self.selectIndex) {
                [self endChouch];
            } else {
                self.selectIndex = row;
                
                NSLog(@"%ld", row);
                [self showMenuView:row];
            }
        }];
        [self addSubview:_menuheader];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, headerMenuHeight - .6, _menuheader.width, .6)];
        lineView.backgroundColor = [UIColor grayColor];
        [self addSubview:lineView];
    }
    return _menuheader;
}

- (RACSubject *)clickSubject
{
    if (!_clickSubject) {
        _clickSubject = [[RACSubject alloc] init];
    }
    return _clickSubject;
}

#pragma mark - set
- (void)setDataSource:(NSArray<FYPullDownModel *> *)dataSource
{
    if (_dataSource != dataSource) {
        _dataSource = dataSource;
        
        NSMutableArray *array = [NSMutableArray array];
        for (FYPullDownModel *each in _dataSource) {
            [array addObject:each.array[0].name];
        }
        self.menuheader.menuArray = array;
    }
}


- (void)showMenuView:(NSInteger)row
{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(pullDownViewWillStartShow:)]) {
            [self.delegate pullDownViewWillStartShow:self];
        }
    }
    
    CGPoint point = [self.superview convertPoint:CGPointMake(0, 0) fromView:self];
    if ([self.superview isKindOfClass:[UIScrollView class]]) {
        UIScrollView *sView = (UIScrollView *)self.superview;
        sView.contentOffset = point;
        sView.scrollEnabled = NO;
    }
    
    self.menuView.height = self.superview.height - headerMenuHeight;
    self.menuView.y = point.y + headerMenuHeight;
    
    self.menuView.selectedIndex = self.dataSource[row].selectIndex;
    self.menuView.dataArray = self.dataSource[row].array;
    
}

- (void)endChouch
{
    if ([self.superview isKindOfClass:[UIScrollView class]]) {
        UIScrollView *sView = (UIScrollView *)self.superview;
        sView.scrollEnabled = YES;
    }
    self.menuView.height = 0;
    self.selectIndex = -1;
    self.menuheader.selectIndex = -1;
}


@end
