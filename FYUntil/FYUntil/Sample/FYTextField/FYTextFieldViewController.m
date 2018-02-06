//
//  FYTextFieldViewController.m
//  FYUntil
//
//  Created by mac on 2018/1/25.
//  Copyright © 2018年 fanyang. All rights reserved.
//

#import "FYTextFieldViewController.h"
#import "FYTextField.h"

@interface FYTextFieldViewController ()
@property (weak, nonatomic) IBOutlet FYTextField *textField1;
@property (weak, nonatomic) IBOutlet FYTextField *textField2;
@end

@implementation FYTextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.textField1.showUnderline = YES;
    
    self.textField1.borderStyle = UITextBorderStyleNone;
    self.textField1.leftItems = @[[[FYTextFieldItem alloc] initWithTitle:@"左边"]];
    self.textField1.rightItems = @[[[FYTextFieldItem alloc] initWithTitle:@"右边"]];
    
    FYTextFieldItem *item1 = [[FYTextFieldItem alloc] initWithTitle:@"1"];
    item1.width = 60;
    [item1.clickSubject subscribeNext:^(id x) {
        NSLog(@"%@", [x title]);
        item1.title = @"10";
    }];
    FYTextFieldItem *item2 = [[FYTextFieldItem alloc] initWithTitle:@"2"];
    item2.width = 20;
    [item2.clickSubject subscribeNext:^(id x) {
        NSLog(@"%@", [x title]);
        item2.title = @"3";
    }];
    
    FYTextFieldItem *item3 = [[FYTextFieldItem alloc] initWithTitle:@"4"];
    item3.width = 20;
    [item3.clickSubject subscribeNext:^(id x) {
        NSLog(@"%@", [x title]);
    }];
    
    self.textField2.leftItems = @[item1,
                                  item2,
                                  [[FYTextFieldItem alloc] initWithTitle:@"3"],
                                  ];
    self.textField2.rightItems = @[[[FYTextFieldItem alloc] initWithTitle:@"5"],
                                   item3,
                                   [[FYTextFieldItem alloc] initWithImage:[UIImage imageNamed:@"test"]]];
    
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
