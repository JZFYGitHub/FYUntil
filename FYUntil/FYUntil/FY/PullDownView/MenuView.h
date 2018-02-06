//
//  MenuView.h
//  kuaibang
//
//  Created by mac on 2017/12/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface MenuView : UIView

/**
 数据数组
 */
@property (nonatomic, strong) NSArray <CommentModel *>*dataArray;

@property (nonatomic, assign) NSInteger selectedIndex;

/**
 点击通知
 */
@property (nonatomic, strong) RACSubject *clickSubject;

/**
 取消通知
 */
@property (nonatomic, strong) RACSubject *dismissSubject;

@end
