//
//  FYHorizontailCollectionViewCell.h
//  模板
//
//  Created by mac on 2017/12/5.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *ChangeHorizontailCellSelectStyleNotification = @"changeHorizontailCellNotication";

@interface FYHorizontailCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIColor *normalColor;

@property (nonatomic, strong) UIColor *selectColor;

@property (nonatomic, assign) BOOL isSelect;


@property (nonatomic, assign) BOOL isShowAccess;

@property (nonatomic, assign) BOOL accessIsSelected;

@end
