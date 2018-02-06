//
//  FYHorizontalMenuViewController.m
//  FYUntil
//
//  Created by mac on 2018/1/26.
//  Copyright © 2018年 fanyang. All rights reserved.
//

#import "FYHorizontalMenuViewController.h"
#import "FYHorizontalMenuView.h"
#import <Masonry.h>
@interface FYHorizontalMenuViewController () <FYHorizontalMenuViewDelegate>

@end

@implementation FYHorizontalMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        FYHorizontalMenuData *data = [[FYHorizontalMenuData alloc] init];
        data.title = @"购物";
        data.imgUrl = @"head";
        [array addObject:data];
    }
    
    FYHorizontalMenuView *view = [[FYHorizontalMenuView alloc] initWithDataSource:array WithPageNumber:5];
    view.delegate = self;
    view.itemSize = CGSizeMake(60, 80);
    view.menuBackgroupColor = [UIColor lightGrayColor];
    view.showPageController = YES;
    view.paddingTop = 12;
    view.paddingLeft = 12;
//    UILabel *lable = [[UILabel alloc] init];
//    lable.textAlignment = NSTextAlignmentCenter;
//    lable.text = @"点击加载更多";
//    view.footerView = lable;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(130);
    }];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        FYHorizontalMenuData *data = [[FYHorizontalMenuData alloc] init];
        data.title = @"购物";
        data.imgUrl = @"test";
        [array addObject:data];
        [array addObject:data];
        view.dataSource = array;
    });
}


- (void)didClickMenuAtIndex:(NSInteger)index
{
    NSLog(@"%ld", index);
}

- (void)didClickFooterView:(UIView *)view
{
    NSLog(@"%@", view);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
