//
//  FYTextFieldItem.h
//  testNew
//
//  Created by mac on 2018/1/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

/**
 使用nsobject
 */
@interface FYTextFieldItem : NSObject

@property(nullable, nonatomic,copy)             NSString    *title;        // default is nil
@property(nullable, nonatomic,strong)           UIImage     *image;        // default is nil
@property(nullable, nonatomic,strong, readonly)           NSAttributedString     *attributedString;        // default is nil
@property(nonatomic)                  NSInteger    tag;          // default is 0
/* You may specify the font, text color, and shadow properties for the title in the text attributes dictionary, using the keys found in NSAttributedString.h.
 */
- (void)setTitleTextAttributes:(nullable NSDictionary<NSAttributedStringKey,id> *)attributes NS_AVAILABLE_IOS(5_0);
- (nullable NSDictionary<NSString *,id> *)titleTextAttributes NS_AVAILABLE_IOS(5_0);

- (instancetype _Nullable )initWithImage:(UIImage *_Nullable)image;
- (instancetype _Nullable )initWithTitle:(NSString *_Nullable)title;

/**
  宽度
 */
@property(nonatomic)         CGFloat              width;            // default is 0.0

/**
  图片填充模式
 */
@property (nonatomic, assign) UIViewContentMode contentMode;

/**
  点击回调
 */
@property (nonatomic, strong, nonnull) RACSubject *clickSubject;


@end
