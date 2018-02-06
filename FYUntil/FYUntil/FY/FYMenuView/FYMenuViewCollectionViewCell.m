//
//  FYMenuViewCollectionViewCell.m
//  模板
//
//  Created by mac on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FYMenuViewCollectionViewCell.h"
#import "FYHorizontalMenuView.h"
#import <Masonry/Masonry.h>
#import "UIImageView+WebCache.h"

@interface FYMenuViewCollectionViewCell ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLable;
@end

@implementation FYMenuViewCollectionViewCell

#pragma mark - lazy
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)titleLable
{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont systemFontOfSize:12];
        _titleLable.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLable;
}

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.titleLable];
        self.titleHeight = 20;
    }
    return self;
}

#pragma mark - set
- (void)setTitleHeight:(CGFloat)titleHeight
{
    if (_titleHeight != titleHeight) {
        _titleHeight = titleHeight;
        
        [self setNeedsLayout];
    }
}

- (void)setData:(FYHorizontalMenuData *)data
{
    _data = data;
    
    self.imageView.image = [UIImage imageNamed:data.imgUrl];
    self.titleLable.text = data.title;
}

#pragma mark - layout
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-self.labelToBottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.mas_equalTo(self.titleHeight);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(self);
        make.bottom.equalTo(self.titleLable.mas_top);
    }];
}

@end
