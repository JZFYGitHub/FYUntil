//
//  SourceView.h
//  评分视图
//
//  Created by 范阳 on 16/3/24.
//  Copyright © 2016年 Coder_fanyang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <ReactiveCocoa/ReactiveCocoa.h>

/**
 说明： 每个按钮的宽高一致
 imageWidth > itemWidth,imageWith无效，  按钮中图片大小跟随uibutton显示
 imageSpace + imageWidth < itemwidth,imageSpace无效, 按钮直接没有间隙
 按钮之间的真实间距为 imageSpace - (itemwidth - imageWidth)
 */
@interface SourceView : UIView

/**
 *  分数
 */
@property(nonatomic, assign, readonly) CGFloat source;

@property (nonatomic, strong) RACSubject *sourceChangeSubject;


/**
 设置分数（设置分数之后将不可点击）

 @param source 分数
 */
- (void)setShowSource:(CGFloat)source;

/**
 *  星星的宽度
 */
@property(nonatomic, assign)CGFloat imageWidth;


/**
 *  图片间距
 */
@property (nonatomic, assign) CGFloat imageSpace;

@end


@interface SourceImageBtn : UIButton

@property(nonatomic, assign)CGFloat imageWidth;

@end
