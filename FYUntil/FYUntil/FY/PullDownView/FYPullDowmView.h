//
//  FYPullDowmView.h
//  kuaibang
//
//  Created by mac on 2017/12/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FYPullDownModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@class FYPullDowmView;

@protocol FYPullDownModelDelegate <NSObject>
@optional
- (void)pullDownViewWillStartShow:(FYPullDowmView *)view;

@end

@interface FYPullDowmView : UIView

@property (nonatomic, strong) NSArray <FYPullDownModel *>*dataSource;

@property (nonatomic, strong) RACSubject *clickSubject;

@property (nonatomic, assign) id<FYPullDownModelDelegate> delegate;


@end
