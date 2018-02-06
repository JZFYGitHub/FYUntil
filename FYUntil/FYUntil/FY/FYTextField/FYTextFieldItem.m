//
//  FYTextFieldItem.m
//  testNew
//
//  Created by mac on 2018/1/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FYTextFieldItem.h"

@interface FYTextFieldItem ()
@property (nonnull, nonatomic, strong) NSDictionary<NSAttributedStringKey,id> *attributes;
@property(nullable, nonatomic,strong, readwrite)           NSAttributedString     *attributedString;        // default is nil
@end

@implementation FYTextFieldItem

#pragma mark - init
- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.image = image;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.title = title;
        
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.alignment = NSTextAlignmentCenter;
        self.attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:15],
                            NSForegroundColorAttributeName: [UIColor blackColor],
                            NSParagraphStyleAttributeName: paragraph,
                            };
        self.attributedString = [[NSAttributedString alloc] initWithString:self.title attributes:self.attributes];
    }
    return self;
}

#pragma mark - get
- (RACSubject *)clickSubject
{
    if (!_clickSubject) {
        _clickSubject = [[RACSubject alloc] init];
    }
    return _clickSubject;
}

- (nullable NSDictionary<NSString *,id> *)titleTextAttributes
{
    return self.attributes;
}

- (void)setTitleTextAttributes:(NSDictionary<NSAttributedStringKey,id> *)attributes
{
    if (self.attributes != attributes) {
        self.attributes = attributes;
        self.attributedString = [[NSAttributedString alloc] initWithString:self.title attributes:self.attributes];
    }
}

- (void)setTitle:(NSString *)title
{
    if (_title != title) {
        _title = title;
        
        
        self.attributedString = [[NSAttributedString alloc] initWithString:_title attributes:self.attributes];
    }
}

@end
