//
//  FYHorizonViewController.m
//  FYUntil
//
//  Created by mac on 2018/1/26.
//  Copyright © 2018年 fanyang. All rights reserved.
//

#import "FYHorizonViewController.h"
#import "FYHorizontalView.h"

@interface FYHorizonViewController ()

@end

@implementation FYHorizonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    FYHorizontalView *hView = [[FYHorizontalView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    hView.menuArray = [NSMutableArray arrayWithArray:@[@"第一个", @"第二个"]];
    [self.view addSubview:hView];
    [[hView.menuClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        NSLog(@"%@",x );
    }];
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
