//
//  FYButton.m
//  模板
//
//  Created by mac on 2017/10/20.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FYButton.h"

@implementation FYButton
//@synthesize backgroundColor = _backgroundColor;

#pragma mark - 初始化
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initcomment];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initcomment];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initcomment];
    }
    return self;
}

- (void)initcomment
{
    self.backgroundColor = [UIColor clearColor];
    self.borderStyle = FYButtonBorderStyleNone;
    self.borderColor = [UIColor grayColor];
    self.borderRectRadius = 0;
    self.fybackgroundColor = [UIColor whiteColor];
    self.borderWidth = .3;
    self.shadowSize = CGSizeMake(0, 3);
}

#pragma mark - set方法
- (void)setFybackgroundColor:(UIColor *)fybackgroundColor
{
    if (![fybackgroundColor isEqual:_fybackgroundColor]) {
        _fybackgroundColor = fybackgroundColor;
        
        [self setNeedsDisplay];
    }
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    if (_borderWidth != borderWidth) {
        _borderWidth = borderWidth;
        [self setNeedsDisplay];
    }
}

- (void)setBorderRectRadius:(CGFloat)borderRectRadius
{
    if (_borderRectRadius != borderRectRadius) {
        _borderRectRadius = borderRectRadius;
        [self setNeedsDisplay];
    }
}

- (void)setBorderStyle:(FYButtonBorderStyle)borderStyle
{
    if (_borderStyle != borderStyle) {
        _borderStyle = borderStyle;
        
        [self setNeedsDisplay];
    }
}

#pragma mark - 背景色
- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    self.fybackgroundColor = backgroundColor;
    if (backgroundColor == [UIColor clearColor]) {
        if (self.backgroundColor != [UIColor clearColor]) {
            [super setBackgroundColor:backgroundColor];
        }
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    const CGRect rectToDraw = self.bounds;
    UIBezierPath *borderPath;
    UIBezierPath *linePath;
    
    BOOL drawBorder = YES;
    switch (self.borderStyle) {
        case FYButtonBorderStyleNone:
            drawBorder = NO;
            borderPath = [UIBezierPath bezierPathWithRect:rectToDraw];
            break;
        case FYButtonBorderStyleRoundedRect:
            borderPath = [UIBezierPath bezierPathWithRoundedRect:rectToDraw cornerRadius:self.borderRectRadius];
            break;
        case FYButtonBorderStyleShadow: {
            drawBorder = NO;
            CGFloat offsizeWidht = self.shadowSize.width;
            CGFloat offsizeHeight = self.shadowSize.height;
            borderPath = [UIBezierPath bezierPathWithRect:CGRectMake(offsizeWidht / 2.0, offsizeHeight / 2.0, self.frame.size.width - offsizeWidht, self.frame.size.height - offsizeHeight)];
            break;
        }
        case FYButtonBorderStyleLine: {
            linePath = [UIBezierPath bezierPath];
            [linePath moveToPoint:CGPointMake(0, self.frame.size.height - self.borderWidth)];
            [linePath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height - self.borderWidth)];
            borderPath = [UIBezierPath bezierPathWithRect:rectToDraw];
            break;
        }
            
        default:
            drawBorder = NO;
            borderPath = [UIBezierPath bezierPathWithRect:rectToDraw];
            break;
    }
//    const CGFloat marginToDrawInside = [self marginToDrawInside];
//    const CGRect rectToDraw = CGRectInset(rect, marginToDrawInside, marginToDrawInside);
    
//    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:rectToDraw byRoundingCorners:(UIRectCorner)UIRectCornerAllCorners cornerRadii:CGSizeMake(JSBadgeViewCornerRadius, JSBadgeViewCornerRadius)];
    
    /* Background and shadow */
    CGContextSaveGState(ctx);
    {
        CGContextAddPath(ctx, borderPath.CGPath);
        
        if (self.fybackgroupdImage) {
            CGContextSetFillColorWithColor(ctx, [UIColor clearColor].CGColor);
        } else {
            CGContextSetFillColorWithColor(ctx, self.fybackgroundColor.CGColor);
        }
        if (self.isShowShadow) {
            CGContextSetShadowWithColor(ctx, self.shadowSize, self.borderRectRadius, [UIColor colorWithRed:0.99 green:0.76 blue:0.12 alpha:.80].CGColor);
        }
        
        CGContextDrawPath(ctx, kCGPathFill);
    }
    CGContextRestoreGState(ctx);
    
    if (self.fybackgroupdImage) {
        [self.fybackgroupdImage drawInRect:self.bounds];
    }
    
    if (drawBorder) {
        CGContextSaveGState(ctx);
        {
            if (self.borderStyle == FYButtonBorderStyleLine) {
                CGContextAddPath(ctx, linePath.CGPath);
            } else {
                CGContextAddPath(ctx, borderPath.CGPath);
            }
            
            CGContextSetStrokeColorWithColor(ctx, self.borderColor.CGColor);
            CGContextSetLineWidth(ctx, self.borderWidth);
            
            CGContextDrawPath(ctx, kCGPathStroke);
        }
        CGContextRestoreGState(ctx);
    }
}

#pragma mark - 选择
- (void)setType:(FYButtonStatusType)type
{
    _type = type;
    
    switch (_type) {
        case FYButtonStatusTypeCheck:{
//            [self setImage:[UIImage imageNamed:@"shdz_mr"] forState:UIControlStateNormal];
//            [self setImage:[UIImage imageNamed:@"sh_xz"] forState:UIControlStateSelected];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationSelectAction:) name:FYPostNotificationNameAllSelected object:nil];
            [self addTarget:self action:@selector(selectAction) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case FYButtonStatusTypeBGChange:{
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            [self setTitleColor:[UIColor colorWithRed:0.25 green:0.25 blue:0.26 alpha:1.00] forState:UIControlStateNormal];
            [self setSelected:NO];
            break;
        }
            
        default:
            break;
    }
}

- (void)notificationSelectAction:(NSNotification *)notification
{
    BOOL select = [notification.object boolValue];
    [self setSelected:select];
}

- (void)selectAction
{
    [self setSelected:!self.selected];
}

- (void)setChangeBg
{
//    [self setBackgroundImage:[CommentClasses getCorderImageByColor:[UIColor colorWithRed:0.97 green:0.57 blue:0.20 alpha:1.00] WithSize:_btnSize WithCornerRadius:2.0] forState:UIControlStateSelected];
//    [self setBackgroundImage:[CommentClasses getCorderImageByColor:[UIColor colorWithRed:0.82 green:0.82 blue:0.82 alpha:1.00] WithSize:_btnSize WithCornerRadius:2.0] forState:UIControlStateNormal];
}


- (void)setIsShowShadow:(BOOL)isShowShadow
{
    _isShowShadow = isShowShadow;
    
    [self setNeedsDisplay];
}

- (void)setShadowSize:(CGSize)shadowSize
{
    _shadowSize = shadowSize;
    
    [self setNeedsDisplay];
}

- (void)setFybackgroupdImage:(UIImage *)fybackgroupdImage
{
    if (_fybackgroupdImage != fybackgroupdImage) {
        _fybackgroupdImage = fybackgroupdImage;
        
        self.contentMode = UIViewContentModeScaleAspectFill;
        [self setNeedsDisplay];
    }
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.type == FYButtonStatusTypeBGChange) {
        [self setChangeBg];
    }
}

- (void)dealloc
{
    if (self.type == FYButtonStatusTypeCheck) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:FYPostNotificationNameAllSelected
                                                      object:nil];
    }
}


@end
