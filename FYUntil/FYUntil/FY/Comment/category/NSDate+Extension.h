//
//  NSDate+Extension.h
//  kuaibang
//
//  Created by mac on 2017/12/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)


/**
 转化为时间字符串

 @param formatter YYYY-MM-dd HH:mm:ss
 @return 时间字符串
 */
- (NSString *)getTimeStringByFormatter:(NSString *)formatter;

- (NSInteger)getAge;


@end
