//
//  FYHorizontalMenuView.h
//  模板
//
//  Created by mac on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

//FYHorizontalMenuView *view = [[FYHorizontalMenuView alloc] initWithDataSource:array WithPageNumber:5];
//view.delegate = self;
//view.itemSize = CGSizeMake(60, 80);
//view.menuBackgroupColor = [UIColor lightGrayColor];
//view.showPageController = NO;
//UILabel *lable = [[UILabel alloc] init];
//lable.textAlignment = NSTextAlignmentCenter;
//lable.text = @"点击加载更多";
//view.footerView = lable;
//[self.view addSubview:view];
//[view mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.top.equalTo(self.view).offset(100);
//    make.width.equalTo(self.view);
//    make.height.mas_equalTo(130);
//}];

#import <UIKit/UIKit.h>

@protocol FYHorizontalMenuViewDelegate <NSObject>

@optional
- (void)didClickMenuAtIndex:(NSInteger)index;

- (void)didClickFooterView:(UIView *)view;

@end

@interface FYHorizontalMenuData : NSObject

- (FYHorizontalMenuData *)initWithTitel:(NSString *)titel
                                     ImgUrl:(NSString *)imgUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imgUrl;

@end


@interface FYHorizontalMenuView : UIView

-(instancetype)initWithFrame:(CGRect)frame
              WithDataSource:(NSArray <FYHorizontalMenuData *> *)dataSource
              WithPageNumber:(NSInteger)number;
-(instancetype)initWithDataSource:(NSArray <FYHorizontalMenuData *> *)dataSource
                   WithPageNumber:(NSInteger)number;


@property (nonatomic, strong) NSArray <FYHorizontalMenuData *>*dataSource;

@property (nonatomic, assign) id<FYHorizontalMenuViewDelegate> delegate;

/**
 是否显示pageController
 */
@property (nonatomic, assign) BOOL showPageController;

/**
 背景色
 */
@property (nonatomic, strong) UIColor *menuBackgroupColor;

/**
 单个控件尺寸
 */
@property (nonatomic, assign) CGSize itemSize;

/**
 每页控件数量
 */
@property (nonatomic, assign) NSInteger numberOfEachPage;


/**
 尾视图
 */
@property (nonatomic, strong) UIView *footerView;


/**
 左边距
 */
@property (nonatomic, assign) CGFloat paddingLeft;

/**
 上边距
 */
@property (nonatomic, assign) CGFloat paddingTop;



@end
