//
//  FYButtonViewController.m
//  FYUntil
//
//  Created by mac on 2018/1/25.
//  Copyright © 2018年 fanyang. All rights reserved.
//

#import "FYButtonViewController.h"

#import "FYButton.h"
@interface FYButtonViewController ()
@property (weak, nonatomic) IBOutlet FYButton *btn1;
@property (weak, nonatomic) IBOutlet FYButton *btn2;
@property (weak, nonatomic) IBOutlet FYButton *btn3;
@property (weak, nonatomic) IBOutlet FYButton *btn4;
@property (weak, nonatomic) IBOutlet FYButton *btn5;
@property (weak, nonatomic) IBOutlet FYButton *btn6;
@property (weak, nonatomic) IBOutlet FYButton *btn7;
@end

@implementation FYButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.btn1.borderStyle = FYButtonBorderStyleShadow;
    self.btn1.isShowShadow = YES;
    
    self.btn2.fybackgroupdImage = [UIImage imageNamed:@"anniu"];
    
    self.btn3.borderStyle = FYButtonBorderStyleRoundedRect;
    self.btn3.borderRectRadius = 12;
    self.btn3.fybackgroundColor = [UIColor redColor];
    
    self.btn4.borderWidth = .6;
    self.btn4.borderColor = [UIColor grayColor];
    self.btn4.borderStyle = FYButtonBorderStyleRoundedRect;
    self.btn4.borderRectRadius = 6;
    
    self.btn5.fybackgroupdImage = [UIImage imageNamed:@"head"];
    self.btn5.borderStyle = FYButtonBorderStyleRoundedRect;
    self.btn5.borderRectRadius = 6;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.btn5.fybackgroupdImage = nil;
        self.btn5.fybackgroundColor = [UIColor greenColor];
    });
    
    self.btn6.borderStyle = FYButtonBorderStyleLine;
    
    self.btn7.type = FYButtonStatusTypeBGChange;
    self.btn7.borderStyle = FYButtonBorderStyleRoundedRect;
    self.btn7.backgroundColor = [UIColor purpleColor];
    self.btn7.borderRectRadius = 10;
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

