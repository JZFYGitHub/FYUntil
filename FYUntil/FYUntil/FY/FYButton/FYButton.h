//
//  FYButton.h
//  模板
//
//  Created by mac on 2017/10/20.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    FYButtonBorderStyleNone,
    FYButtonBorderStyleLine,
//    FYButtonBorderStyleBezel,
    FYButtonBorderStyleRoundedRect,
    FYButtonBorderStyleShadow
} FYButtonBorderStyle;

typedef enum : NSUInteger {
    /** 选择状态按钮，添加全选通知 */
    FYButtonStatusTypeCheck,
    /** 背景状态变化 */
    FYButtonStatusTypeBGChange,
} FYButtonStatusType;

@interface FYButton : UIButton

#pragma mark - 背景色
/**
 背景色 默认背景色设置为clear
 */
@property (nonatomic, strong) UIColor *fybackgroundColor;
@property (nonatomic, strong) UIImage *fybackgroupdImage;

#pragma mark - 边框
/**
 边框类型
 */
@property (nonatomic, assign) FYButtonBorderStyle borderStyle;

/**
 边框颜色
 */
@property (nonatomic, strong) UIColor *borderColor;
/**
 边框宽度
 */
@property (nonatomic, assign) CGFloat borderWidth;

/**
 圆角度数，默认为0
 */
@property (nonatomic, assign) CGFloat borderRectRadius;

#pragma mark - 选择

/**
 按钮补充类型
 */
@property (nonatomic, assign) FYButtonStatusType type;


/**
 是否显示阴影
 */
@property (nonatomic, assign) BOOL isShowShadow;
@property (nonatomic, assign) CGSize shadowSize;


@end

//@interface FYButton (ImageTitleType)
//1- 重写两个方法
//2- 使用edge
//@property (nonatomic, assign) FYBUttonImageTitleType
//@end

//全选通知
static NSString *FYPostNotificationNameAllSelected = @"fybuttonallSelected";
