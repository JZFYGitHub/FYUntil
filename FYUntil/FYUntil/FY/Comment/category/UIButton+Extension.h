//
//  UIButton+Extension.h
//  PackageView
//
//  Created by 白鹤 on 16/9/12.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

/**
 *  点击事件触发范围
 *  输入 正数表示缩小, 负数表示扩大
 */
@property(nonatomic, assign) UIEdgeInsets hitEdgeInsets;


/**
 *  上图片 下文字
 *
 *  @param spacing 间距
 */
- (void)verticalImageAndTitle:(CGFloat)spacing;

/**
 *  左图片 右文字
 *
 *  @param spacing 间距
 */
- (void)leftImageAndRightText:(CGFloat)spacing;


/**
 *  左文字 右图片
 *
 *  @param spacing 间距
 */
- (void)leftTextAndRightImage:(CGFloat)spacing;

@end
