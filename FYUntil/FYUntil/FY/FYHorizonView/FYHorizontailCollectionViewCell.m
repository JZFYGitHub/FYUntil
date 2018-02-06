//
//  FYHorizontailCollectionViewCell.m
//  模板
//
//  Created by mac on 2017/12/5.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FYHorizontailCollectionViewCell.h"

@interface FYHorizontailCollectionViewCell ()
@end

@implementation FYHorizontailCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self commentInit];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commentInit];
    }
    return self;
}

- (void)commentInit
{
    self.selectColor = [UIColor colorWithRed:0.95 green:0.15 blue:0.13 alpha:1.00];
    self.normalColor = [UIColor colorWithRed:0.09 green:0.11 blue:0.15 alpha:1.00];
    self.isSelect = NO;
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.frame = self.bounds;
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor blackColor];
    [self addSubview:self.titleLabel];
    
    self.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSelectNotification:) name:ChangeHorizontailCellSelectStyleNotification object:nil];
}


- (void)setisShowAccess:(BOOL)isShowAccess
{
    if (_isShowAccess != isShowAccess) {
        _isShowAccess = isShowAccess;
        
        [self setNeedsDisplay];
    }
}

- (void)setAccessIsSelected:(BOOL)accessIsSelected
{
    if (_accessIsSelected != accessIsSelected) {
        _accessIsSelected = accessIsSelected;
        
        [self setNeedsDisplay];
    }
}

- (void)didSelectNotification:(NSNotification *)notification
{
    FYHorizontailCollectionViewCell *selectCell = notification.object;
    if (selectCell == self) {
        self.isSelect = YES;
    } else {
        self.isSelect = NO;
    }
}

- (void)setIsSelect:(BOOL)isSelect
{
    _isSelect = isSelect;
    
    self.accessIsSelected = _isSelect;
    if (_isSelect) {
        self.titleLabel.textColor = self.selectColor;
    } else {
        self.titleLabel.textColor = self.normalColor;
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ChangeHorizontailCellSelectStyleNotification object:nil];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self.isShowAccess) {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        UIBezierPath *borderPath = [UIBezierPath bezierPath];
        
        CGFloat startX;
        CGFloat startY;
        CGFloat width;
        CGFloat height;
        if (!self.accessIsSelected) {
            startX = (self.frame.size.width / 2.0) + 35.0;
            startY = (self.frame.size.height / 2.0) - 2.0;
            width = 6;
            height = 4;
        } else {
            startX = (self.frame.size.width / 2.0) + 35.0;
            startY = (self.frame.size.height / 2.0) + 2.0;
            width = 6;
            height = -4;
        }
        
        
        [borderPath moveToPoint:CGPointMake(startX, startY)];
        [borderPath addLineToPoint:CGPointMake(startX + width, startY)];
        [borderPath addLineToPoint:CGPointMake(startX + width / 2.0, startY + height)];
        [borderPath addLineToPoint:CGPointMake(startX, startY)];
        
        CGContextSaveGState(ctx);
        {
            CGContextAddPath(ctx, borderPath.CGPath);
            
            if (self.accessIsSelected) {
                CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
            } else {
                CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
            }
            
            CGContextDrawPath(ctx, kCGPathFill);
        }
        CGContextRestoreGState(ctx);
    }
}


@end
