//
//  NSString+Extension.h
//  PackageView
//
//  Created by 白鹤 on 16/9/8.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

/**
*  返回值该字符串所占的大小(width, height)
*
*  @param font    该字符串所用的字体(字体大小不一样,显示出来的面积也不同)
*  @param maxSize 限制改字体的最大宽和高
    (如果显示一行,则宽高都设置为MAXFLOAT,
    如果显示为多行,只需将宽设置一个有限定长值,高设置为MAXFLOAT)
*/
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;


@end


