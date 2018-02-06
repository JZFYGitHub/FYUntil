//
//  FYMenuCell.h
//  模板
//
//  Created by mac on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FYHorizontalMenuData;
@class FYMenuCell;
@protocol FYMenuCellDelegate <NSObject>

@optional
- (void)menuView:(FYMenuCell *)view
   DidClickIndex:(NSInteger)index;

@end

@interface FYMenuCell : UICollectionViewCell


@property (nonatomic, strong) NSArray <FYHorizontalMenuData *>* dataSource;
@property (nonatomic, assign) id<FYMenuCellDelegate> delegate;

/**
 控件尺寸
 */
@property (nonatomic, assign) CGSize itemSize;

/**
 每页控件数量
 */
@property (nonatomic, assign) NSInteger numberOfEachPage;
/**
 左边距
 */
@property (nonatomic, assign) CGFloat paddingLeft;

/**
 上边距
 */
@property (nonatomic, assign) CGFloat paddingTop;

@end
