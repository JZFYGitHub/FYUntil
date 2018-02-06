//
//  FYTextField.m
//  模板
//
//  Created by mac on 2017/10/20.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FYTextField.h"
#import "UIView+Extension.h"
#import "NSString+Extension.h"

static NSInteger startTag = 2600;

@interface FYTextField ()
@end

@implementation FYTextField

#pragma mark - 初始化
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self commentInitAction];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commentInitAction];
    }
    return self;
}

- (void)commentInitAction
{
    
}

#pragma mark - 视图布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

- (void)changeEditingRect
{
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self.showUnderline) {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        CGFloat lineWidth = .8;
        CGRect rectToDraw = CGRectMake(0, self.height - lineWidth, self.width, lineWidth);
        UIBezierPath *borderPath = [UIBezierPath bezierPathWithRect:rectToDraw];
        
        CGContextSaveGState(ctx);
        {
            CGContextAddPath(ctx, borderPath.CGPath);
            
            CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:0.95 green:0.95 blue:0.96 alpha:1.00].CGColor);
            
            CGContextDrawPath(ctx, kCGPathFill);
        }
    }
}

#pragma mark - tiems
- (void)setLeftItems:(NSArray<FYTextFieldItem *> *)leftItems
{
    if (_leftItems != leftItems) {
        _leftItems = leftItems;
        
        self.leftViewMode = UITextFieldViewModeAlways;
        if (_leftItems.count == 0) {
            self.leftViewMode = UITextFieldViewModeNever;
        } else {
            self.leftView = [self getAccessViewWithItems:_leftItems dirction:NO];
            
        }
        
    }
}

- (void)setRightItems:(NSArray<FYTextFieldItem *> *)rightItems
{
    if (_rightItems != rightItems) {
        _rightItems = rightItems;
        
        self.rightViewMode = UITextFieldViewModeAlways;
        if (_rightItems.count == 0) {
            self.rightViewMode = UITextFieldViewModeNever;
        } else {
            self.rightView = [self getAccessViewWithItems:_rightItems dirction:YES];
        }
    }
}

- (UIView *)getAccessViewWithItems:(NSArray<FYTextFieldItem *> *)items
                          dirction:(BOOL)isRight
{
    UIView *view = [[UIView alloc] init];
    NSInteger count = items.count;
    CGFloat totalWidth = 0;
    NSMutableArray *widthArray = [NSMutableArray array];
    //添加视图
    for (NSInteger i = 0; i < count; i++) {
        FYTextFieldItem *item = items[i];
        if (item.title) {
            //标题
            UILabel *label = [self getLabel];
            label.attributedText = [[NSAttributedString alloc] initWithString:item.title attributes:[item titleTextAttributes]];
//            RACChannelTo(label, attributedText) = RACChannelTo(item, attributedString);
            RAC(label, attributedText) = RACObserve(item, attributedString);
            //设置tag
            if (isRight) {
                label.tag = item.tag = startTag - i;
            } else {
                label.tag = item.tag = startTag + i + 1;
            }
            [view addSubview:label];
            
            //添加宽度
            if (item.width) {
                totalWidth += item.width;
                [widthArray addObject:@(item.width)];
            } else {
                CGFloat titleWidth = [item.title sizeWithAttributes:[item titleTextAttributes]].width + 10;
                totalWidth += titleWidth;
                [widthArray addObject:@(titleWidth)];
            }
            //点击
            label.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
            [label addGestureRecognizer:tap];
        } else if (item.image) {
            //图片
            UIImageView *imageView = [self getImageView];
            imageView.image = item.image;
            imageView.contentMode = item.contentMode;
            //设置tag
            if (isRight) {
                imageView.tag = item.tag = startTag - i;
            } else {
                imageView.tag = item.tag = startTag + i + 1;
            }
            [view addSubview:imageView];
            //添加宽度
            totalWidth += self.height;
            [widthArray addObject:@(self.height)];
            //点击
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
            [imageView addGestureRecognizer:tap];
        }
    }
    //设置frame
    view.frame = CGRectMake(0, 0, totalWidth, self.height);
    if (isRight) {
        //右侧
        CGFloat eachX = 0;
        for (NSInteger i = count - 1; i >= 0; i--) {
            UIView *each = [view viewWithTag:startTag - i];
            CGFloat eachWidth = [widthArray[i] doubleValue];
            each.frame = CGRectMake(eachX, 0, eachWidth, self.height);
            eachX += eachWidth;
        }
    } else {
        //左侧
        CGFloat eachX = 0;
        for (NSInteger i = 0; i < count; i++) {
            UIView *each = [view viewWithTag:startTag + i + 1];
            CGFloat eachWidth = [widthArray[i] doubleValue];
            each.frame = CGRectMake(eachX, 0, eachWidth, self.height);
            eachX += eachWidth;
        }
    }
    return view;
}

- (UILabel *)getLabel
{
    UILabel *label = [[UILabel alloc] init];
    return label;
}

- (UIImageView *)getImageView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    return imageView;
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    NSInteger tag = tap.view.tag;
    if (tag <= startTag) {
        //右侧
        FYTextFieldItem *item = self.rightItems[startTag - tag];
        [item.clickSubject sendNext:item];
    } else {
        //左侧
        FYTextFieldItem *item = self.leftItems[tag - startTag - 1];
        [item.clickSubject sendNext:item];
    }
}

@end
