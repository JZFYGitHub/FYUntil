//
//  MainTableViewController.m
//  FYUntil
//
//  Created by mac on 2018/1/25.
//  Copyright © 2018年 fanyang. All rights reserved.
//

#import "MainTableViewController.h"
#import "FYTextFieldViewController.h"
#import "FYButtonViewController.h"
#import "FYSourceViewController.h"
#import "FYHorizonViewController.h"
#import "FYHorizontalMenuViewController.h"
#import "FYPullDownViewController.h"

static NSString *cellIdentier = @"maincell";

@interface MainTableViewController ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.dataSource = [NSMutableArray arrayWithArray:@[
                                                       @"FYButton",
                                                       @"FYHorizonView",
                                                       @"FYMenuView",
                                                       @"FYTextField",
                                                       @"PullDownView",
                                                       @"SourceView",
                                                       ]];
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    @"FYButton",
//    @"FYHorizonView",
//    @"FYMenuView",
//    @"FYTextField",
//    @"PullDownView",
//    @"SourceView",
    NSString *text = self.dataSource[indexPath.row];
    if ([text isEqualToString:@"FYButton"]) {
        FYButtonViewController *vc = [[FYButtonViewController alloc] initWithNibName:@"FYButtonViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    } else if ([text isEqualToString:@"FYTextField"]) {
        FYTextFieldViewController *vc = [[FYTextFieldViewController alloc] initWithNibName:@"FYTextFieldViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
        NSLog(@"%@", indexPath);
    } else if ([text isEqualToString:@"SourceView"]) {
        FYSourceViewController *vc = [[FYSourceViewController alloc] initWithNibName:@"FYSourceViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    } else if ([text isEqualToString:@"FYHorizonView"]) {
        FYHorizonViewController *vc = [[FYHorizonViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if ([text isEqualToString:@"FYMenuView"]) {
        FYHorizontalMenuViewController  *vc = [[FYHorizontalMenuViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if ([text isEqualToString:@"PullDownView"]) {
        FYPullDownViewController *vc = [[FYPullDownViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
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
