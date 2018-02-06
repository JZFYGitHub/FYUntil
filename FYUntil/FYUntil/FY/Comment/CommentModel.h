//
//  CommentModel.h
//  gyyx
//
//  Created by mac on 2017/11/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject

@property (nonatomic, strong) NSString *Id;//"id": "4",   //类id
@property (nonatomic, strong) NSString *name;//"name": "分类四"   //类名称
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *iamgeUrl;

- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name
               WithImageName:(NSString *)imageName;

@end

@interface PulishType : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *cellType;
@property (nonatomic, strong) NSString *result;

- (instancetype)initWithName:(NSString *)name
                    CellType:(NSString *)cellType;
@end
