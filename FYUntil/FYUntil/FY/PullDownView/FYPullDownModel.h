//
//  FYPullDownModel.h
//  kuaibang
//
//  Created by mac on 2017/12/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentModel.h"

@interface FYPullDownModel : NSObject

@property (nonatomic, strong) NSArray <CommentModel *> *array;

@property (nonatomic, assign) NSInteger selectIndex;

@end
