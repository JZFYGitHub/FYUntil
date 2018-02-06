//
//  UIImageView+Extension.m
//  kuaibang
//
//  Created by mac on 2017/12/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "UIImageView+Extension.h"

@implementation UIImageView (Extension)



- (UIImageView *)roundedRectImageViewWithCornerRadius:(CGFloat)cornerRadius {
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    layer.path = bezierPath.CGPath;
    
    self.layer.mask = layer;
    
    
    
    return self;
    
}

@end
