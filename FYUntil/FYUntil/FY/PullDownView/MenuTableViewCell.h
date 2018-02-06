//
//  MenuTableViewCell.h
//  kuaibang
//
//  Created by mac on 2017/12/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *menuTableViewCellNotification = @"menuTableViewCellNotification";

@interface MenuTableViewCell : UITableViewCell

@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *normalColor;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, assign) BOOL isSelected;

@end
