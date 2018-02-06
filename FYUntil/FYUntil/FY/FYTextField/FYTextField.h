//
//  FYTextField.h
//  模板
//
//  Created by mac on 2017/10/20.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FYTextFieldItem.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface FYTextField : UITextField

@property (nonatomic, assign) BOOL showUnderline;

@property (nonatomic, strong) NSArray <FYTextFieldItem *>*leftItems;
@property (nonatomic, strong) NSArray <FYTextFieldItem *>*rightItems;

@end
