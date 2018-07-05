//
//  TEUITabBarController.m
//  Tabbar_Test
//
//  Created by 屈亮 on 2018/7/5.
//  Copyright © 2018年 屈亮. All rights reserved.
//
#define k_ClassKey         @"rootViewController"
#define k_TitleKey          @"title"
#define k_ImageKey          @"imgae"
#define k_SelectImageKey    @"selectedImage"
//导航默认颜色
#define NAVGATION_COLOR [UIColor colorWithRed:45.0/255.0 green:180.0/255.0 blue:145.0/255.0 alpha:1.0]
#import "TEUITabBarController.h"
#import "TENavigationController.h"
#import "HomeViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"
@interface TEUITabBarController ()

@end

@implementation TEUITabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   NSArray *childItemsArray = @[
                                @{
                                    k_ClassKey       : @"HomeViewController",
                                    k_TitleKey       : @"首页",
                                    k_ImageKey       : @"首页-未选中-",
                                    k_SelectImageKey : @"首页-选中"
                                    },
                                @{
                                    k_ClassKey       : @"DiscoverViewController",
                                    k_TitleKey       : @"发现",
                                    k_ImageKey       : @"发现-未选中",
                                    k_SelectImageKey : @"发现-选中"
                                    },
                                @{
                                    k_ClassKey       : @"MineViewController",
                                    k_TitleKey       : @"个人",
                                    k_ImageKey       : @"个人-未选中",
                                    k_SelectImageKey : @"个人-选中-"
                                    }
                                ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIViewController *vc = [NSClassFromString(dict[k_ClassKey]) new];
        vc.title = dict[k_TitleKey];
        TENavigationController *nav = [[TENavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[k_TitleKey];
        item.image =  [UIImage imageNamed:dict[k_ImageKey]];
        item.selectedImage = [[UIImage imageNamed:dict[k_SelectImageKey]] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : NAVGATION_COLOR
                                       } forState:UIControlStateSelected];
        [self addChildViewController:nav];
        
    }];
}


@end
