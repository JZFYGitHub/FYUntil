//
//  SourceView.m
//  评分视图
//
//  Created by 范阳 on 16/3/24.
//  Copyright © 2016年 Coder_fanyang. All rights reserved.
//

#import "SourceView.h"
#import "UIView+Extension.h"

#define SourceStartTag 2200

static NSString *fullImageName = @"xingji";
static NSString *emptyImageName = @"xingji2";
static NSString *halfImageName = @"xingji1";


@interface SourceView ()
@property(nonatomic, assign, readwrite) CGFloat source;

@property(nonatomic, strong)SourceImageBtn *button1;
@property(nonatomic, strong)SourceImageBtn *button2;
@property(nonatomic, strong)SourceImageBtn *button3;
@property(nonatomic, strong)SourceImageBtn *button4;
@property(nonatomic, strong)SourceImageBtn *button5;
@property(nonatomic, strong)NSArray *buttonArray;
@end



@implementation SourceView

#pragma mark - init
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self commentInit];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commentInit];
    }
    return self;
}

- (void)commentInit
{
    
    _button1 = [SourceImageBtn buttonWithType:UIButtonTypeCustom];
    _button1.tag = SourceStartTag + 1;
    [_button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_button1 setImage:[UIImage imageNamed:emptyImageName] forState:UIControlStateNormal];
    [_button1 setImage:[UIImage imageNamed:fullImageName] forState:UIControlStateSelected];
    [self addSubview:_button1];
    
    
    _button2 = [SourceImageBtn buttonWithType:UIButtonTypeCustom];
    _button2.tag = SourceStartTag + 2;
    [_button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_button2 setImage:[UIImage imageNamed:emptyImageName] forState:UIControlStateNormal];
    [_button2 setImage:[UIImage imageNamed:fullImageName] forState:UIControlStateSelected];
    [self addSubview:_button2];
    
    _button3 = [SourceImageBtn buttonWithType:UIButtonTypeCustom];
    _button3.tag = SourceStartTag + 3;
    [_button3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_button3 setImage:[UIImage imageNamed:emptyImageName] forState:UIControlStateNormal];
    [_button3 setImage:[UIImage imageNamed:fullImageName] forState:UIControlStateSelected];
    [self addSubview:_button3];
    
    _button4 = [SourceImageBtn buttonWithType:UIButtonTypeCustom];
    _button4.tag = SourceStartTag + 4;
    [_button4 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_button4 setImage:[UIImage imageNamed:emptyImageName] forState:UIControlStateNormal];
    [_button4 setImage:[UIImage imageNamed:fullImageName] forState:UIControlStateSelected];
    [self addSubview:_button4];
    
    _button5 = [SourceImageBtn buttonWithType:UIButtonTypeCustom];
    _button5.tag = SourceStartTag + 5;
    [_button5 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_button5 setImage:[UIImage imageNamed:emptyImageName] forState:UIControlStateNormal];
    [_button5 setImage:[UIImage imageNamed:fullImageName] forState:UIControlStateSelected];
    [self addSubview:_button5];
    
    _buttonArray = @[_button1, _button2, _button3, _button4, _button5];
    if (_imageWidth == 0) {
        self.imageWidth = 24;
    }
    if (_imageSpace == 0) {
        self.imageSpace = 20;
    }
    if (_source == 0) {
        self.source = 5;
    }
}

#pragma mark - setAction
- (void)setShowSource:(CGFloat)source
{
    self.source = source;
    self.userInteractionEnabled = NO;
}

- (void)setSource:(CGFloat)source
{
    if (_source != source) {
        _source = source;
        
        NSInteger mySource = _source * 20;
        NSInteger numberOfFullStart = mySource / 20;
        NSInteger flag = 0;
        if (mySource % 20 != 0) {
            flag = 1;
        }
        
        NSMutableArray *array = [NSMutableArray array];
        for (NSInteger i = 0; i <= 4; i++) {
            if (i <= numberOfFullStart - 1) {
                UIImage *image = [UIImage imageNamed:fullImageName];
                [array addObject:image];
            }
            else{
                if (flag == 1) {
                    UIImage *image = [UIImage imageNamed:halfImageName];
                    [array addObject:image];
                    flag = 0;
                }
                else{
                    UIImage *image = [UIImage imageNamed:emptyImageName];
                    [array addObject:image];
                }
            }
            
        }
        
        [_button1 setImage:array[0] forState:UIControlStateNormal];
        [_button2 setImage:array[1] forState:UIControlStateNormal];
        [_button3 setImage:array[2] forState:UIControlStateNormal];
        [_button4 setImage:array[3] forState:UIControlStateNormal];
        [_button5 setImage:array[4] forState:UIControlStateNormal];
        [self updateImageWidth];
    }
}

- (void)setImageWidth:(CGFloat)imageWidth
{
    if (_imageWidth != imageWidth) {
        _imageWidth = imageWidth;
        
        [self updateImageWidth];
        NSLog(@"%.2f", imageWidth);
        [self setNeedsLayout];
    }
}


- (void)setImageSpace:(CGFloat)imageSpace
{
    if (_imageSpace != imageSpace) {
        _imageSpace = imageSpace;
        
        [self setNeedsLayout];
    }
}

- (RACSubject *)sourceChangeSubject
{
    if (!_sourceChangeSubject) {
        _sourceChangeSubject = [[RACSubject alloc] init];
    }
    return _sourceChangeSubject;
}

#pragma mark - private
/**
 更新图片大小
 */
- (void)updateImageWidth
{
    for (SourceImageBtn *each in _buttonArray) {
        each.imageWidth = _imageWidth;
    }
}

#pragma mark - layoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat itemWidth = self.frame.size.height;
    CGFloat itemSpace = 0;
    if (self.imageSpace + self.imageWidth > itemWidth) {
        itemSpace = self.imageSpace - (itemWidth - self.imageWidth);
    }
    
    _button1.frame = CGRectMake(0, 0, itemWidth, itemWidth);
    _button2.frame = CGRectMake((itemWidth + itemSpace), _button1.frame.origin.y, itemWidth, itemWidth);
    _button3.frame = CGRectMake((itemWidth + itemSpace) * 2, _button1.frame.origin.y, itemWidth, itemWidth);
    _button4.frame = CGRectMake((itemWidth + itemSpace) * 3, _button1.frame.origin.y, itemWidth, itemWidth);
    _button5.frame = CGRectMake((itemWidth + itemSpace) * 4, _button1.frame.origin.y, itemWidth, itemWidth);
}

#pragma mark - 点击方法
- (void)buttonAction:(UIButton *)button
{
    if (_source == button.tag - SourceStartTag) {
        return;
    }
    for (UIButton *each in _buttonArray) {
        if (each.tag > button.tag) {
            if (each.selected == YES) {
                each.selected = NO;
            }
        }
        else{
            if (each.selected == NO) {
                each.selected = YES;
            }
        }
    }
    self.source = button.tag - SourceStartTag;
    [self.sourceChangeSubject sendNext:@(self.source)];
}

@end


@implementation SourceImageBtn

- (void)setImageWidth:(CGFloat)imageWidth
{
    if (_imageWidth != imageWidth) {
        _imageWidth = imageWidth;
        
        if (_imageWidth < self.width) {
            CGFloat insets = (self.width - _imageWidth) / 2.0;
            self.imageEdgeInsets = UIEdgeInsetsMake(insets, insets, insets, insets);
        }
    }
}


@end
