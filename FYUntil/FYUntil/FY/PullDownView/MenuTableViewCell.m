//
//  MenuTableViewCell.m
//  kuaibang
//
//  Created by mac on 2017/12/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MenuTableViewCell.h"
#import <Masonry.h>
@interface MenuTableViewCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *accessImageView;
@end

@implementation MenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commentInit];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self commentInit];
    }
    return self;
}

- (void)commentInit
{
    self.isSelected = NO;
    self.selectedColor = [UIColor redColor];
    self.normalColor = [UIColor blackColor];
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.accessImageView];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:menuTableViewCellNotification object:nil];
}

- (void)notification:(NSNotification *)notification
{
    MenuTableViewCell *cell = notification.object;
    if (self == cell) {
        self.isSelected = YES;
    } else {
        self.isSelected = NO;
    }
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = self.normalColor;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return _titleLabel;
}

- (UIImageView *)accessImageView
{
    if (!_accessImageView) {
        _accessImageView = [[UIImageView alloc] init];
        _accessImageView.image = [UIImage imageNamed:@"duigou"];
        _accessImageView.contentMode = UIViewContentModeCenter;
        
    }
    return _accessImageView;
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    
    if (_isSelected) {
        self.accessImageView.hidden = NO;
        self.titleLabel.textColor = self.selectedColor;
    } else {
        self.accessImageView.hidden = YES;
        self.titleLabel.textColor = self.normalColor;
    }
}

- (void)setTitle:(NSString *)title
{
    if (_title != title) {
        _title = title;
        
        self.titleLabel.text = _title;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.accessImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-12);
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(44);
    }];
    
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(40);
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(150);
    }];
}

@end
