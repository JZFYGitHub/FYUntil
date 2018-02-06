//
//  MenuView.m
//  kuaibang
//
//  Created by mac on 2017/12/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MenuView.h"
#import "MenuTableViewCell.h"
#import "UIView+Extension.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

static NSString *cellidentifer = @"menuviewcell";

@interface MenuView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *footerView;
@end

@implementation MenuView

#pragma mark - init
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commentInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commentInit];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self commentInit];
}

- (void)commentInit
{
    self.selectedIndex = 0;
    
}

#pragma mark - get
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50) style:UITableViewStylePlain];
        _tableView.rowHeight = 44;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.bounces = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = self.footerView;
        [_tableView registerClass:[MenuTableViewCell class] forCellReuseIdentifier:cellidentifer];
        [self addSubview:_tableView];
    }
    return _tableView;
}

- (UIView *)footerView
{
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        _footerView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.7];
        [_footerView addTarget:self action:@selector(hiddenAction)];
    }
    return _footerView;
}

- (RACSubject *)clickSubject
{
    if (!_clickSubject) {
        _clickSubject = [[RACSubject alloc] init];
    }
    return _clickSubject;
}

- (RACSubject *)dismissSubject
{
    if (!_dismissSubject) {
        _dismissSubject = [[RACSubject alloc] init];
    }
    return _dismissSubject;
}

#pragma mark - set

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    self.tableView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
//    [self.tableView reloadData];
}

- (void)setDataArray:(NSArray *)dataArray
{
    if (_dataArray != dataArray) {
        _dataArray = dataArray;

//        self.tableView.frame = self.bounds;
    }
    NSInteger count = _dataArray.count;
    if (count * 44 < self.height) {
        self.footerView.height = self.height - count * 44;
    } else {
        self.footerView.height = 0;
    }
    [self.tableView reloadData];
}

#pragma mark - tableviewdelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifer forIndexPath:indexPath];
    cell.title = self.dataArray[indexPath.row].name;
    if (indexPath.row == self.selectedIndex) {
        cell.isSelected = YES;
    } else {
        cell.isSelected = NO;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = (MenuTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [[NSNotificationCenter defaultCenter] postNotificationName:menuTableViewCellNotification object:cell];
    [self.clickSubject sendNext:@(indexPath.row)];
    [self hiddenAction];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark 隐藏视图
- (void)hiddenAction
{
    [self.dismissSubject sendNext:nil];
    self.height = 0;
}

@end
