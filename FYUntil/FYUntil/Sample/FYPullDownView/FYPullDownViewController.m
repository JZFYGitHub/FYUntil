//
//  FYPullDownViewController.m
//  FYUntil
//
//  Created by mac on 2018/1/26.
//  Copyright © 2018年 fanyang. All rights reserved.
//

#import "FYPullDownViewController.h"
#import "FYPullDowmView.h"

@interface FYPullDownViewController ()
@property (nonatomic, strong) FYPullDowmView *headerView;
@end

@implementation FYPullDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.headerView];
}

- (FYPullDowmView *)headerView
{
    if (!_headerView) {
        _headerView = [[FYPullDowmView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 44)];
        [[_headerView.clickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
            NSIndexPath *indexPath = x;
            NSLog(@"%@", indexPath);
        }];
        
        
        NSMutableArray *myArray = [NSMutableArray array];
        //1- 区信息
        NSMutableArray *locationArray = [NSMutableArray array];
        [locationArray addObject:[[CommentModel alloc] initWithName:@"全部地区"]];
        for (NSInteger i = 0; i < 15; i++) {
            [locationArray addObject:[[CommentModel alloc] initWithName:@"中国"]];
        }
        FYPullDownModel *locationModel = [[FYPullDownModel alloc] init];
        locationModel.selectIndex = 0;
        locationModel.array = locationArray;
        //2- 距离信息
        NSArray *distanceArray = @[[[CommentModel alloc] initWithName:@"距离最近"],
                                   [[CommentModel alloc] initWithName:@"薪资最高"],
                                   [[CommentModel alloc] initWithName:@"薪资最低"]];
        FYPullDownModel *distanceModel = [[FYPullDownModel alloc] init];
        distanceModel.selectIndex = 0;
        distanceModel.array = distanceArray;
        
        [myArray addObject:locationModel];
        [myArray addObject:distanceModel];
        
        _headerView.dataSource = myArray;
    }
    return _headerView;
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
