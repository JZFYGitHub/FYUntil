//
//  CommentModel.m
//  gyyx
//
//  Created by mac on 2017/11/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CommentModel.h"

#pragma mark - CommentModel
@implementation CommentModel

+ (void)load
{
//    [CommentModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{
//                 @"Id": @"id"
//                 };
//    }];
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
               WithImageName:(NSString *)imageName
{
    self = [super init];
    if (self) {
        self.name = name;
        self.imageName = imageName;
    }
    return self;
}

@end

#pragma mark - PulishType
@implementation PulishType
- (instancetype)initWithName:(NSString *)name CellType:(NSString *)cellType
{
    self = [super init];
    if (self) {
        self.name = name;
        self.cellType = cellType;
        self.result = @"请选择";
    }
    return self;
}
@end
