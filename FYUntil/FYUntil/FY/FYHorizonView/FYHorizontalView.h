//
//  FYHorizontalView.h
//  模板
//
//  Created by mac on 2017/12/5.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface FYHorizontalView : UIView

@property (nonatomic, strong) NSMutableArray *menuArray;
@property (nonatomic, strong) RACSubject *menuClickSubject;


/**
 是否显示滑块视图，默认为YES
 */
@property (nonatomic, assign) BOOL showSlideView;

/**
 滑块视图
 */
@property (nonatomic, strong) UIView *slideView;

@property (nonatomic, assign) NSInteger selectIndex;


@property (nonatomic, strong) UIColor *normalColor;

@property (nonatomic, strong) UIColor *selectColor;


@property (nonatomic, assign) BOOL isShowAccess;


@end
