//
//  FYMenuViewCollectionViewCell.h
//  模板
//
//  Created by mac on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FYHorizontalMenuData;

@interface FYMenuViewCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) FYHorizontalMenuData *data;

/**
 标题高度 默认20
 */
@property (nonatomic, assign) CGFloat titleHeight;

/**
 图片和问题高度差
 */
@property (nonatomic, assign) CGFloat labelToBottom;

@end
