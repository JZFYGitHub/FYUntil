//
//  UITabBar+PGExt.h
//  PowerGroup
//
//  Created by xuchen on 2016/12/28.
//  Copyright © 2016年 xushichen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (PGExt)

- (void)showBadgeOnItemIndex:(NSInteger)index;   ///<显示小红点

- (void)hideBadgeOnItemIndex:(NSInteger)index;  ///<隐藏小红点

@end
