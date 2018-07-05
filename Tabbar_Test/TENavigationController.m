//
//  TENavigationController.m
//  Tabbar_Test
//
//  Created by 屈亮 on 2018/7/5.
//  Copyright © 2018年 屈亮. All rights reserved.
//
//导航默认颜色
#define NAVGATION_COLOR [UIColor colorWithRed:45.0/255.0 green:180.0/255.0 blue:145.0/255.0 alpha:1.0]
#import "TENavigationController.h"

@interface TENavigationController ()

@end

@implementation TENavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = NAVGATION_COLOR;
    bar.tintColor = [UIColor whiteColor];
    bar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
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
