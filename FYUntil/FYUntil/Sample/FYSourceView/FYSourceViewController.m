//
//  FYSourceViewController.m
//  FYUntil
//
//  Created by mac on 2018/1/25.
//  Copyright © 2018年 fanyang. All rights reserved.
//

#import "FYSourceViewController.h"
#import "SourceView.h"

@interface FYSourceViewController ()
@property (weak, nonatomic) IBOutlet SourceView *sourceView1;
@property (weak, nonatomic) IBOutlet SourceView *sourceView2;

@end

@implementation FYSourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.sourceView2 setShowSource:3.5];
    
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
