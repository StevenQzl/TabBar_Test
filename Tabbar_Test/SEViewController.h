//
//  SEViewController.h
//  Tabbar_Test
//
//  Created by 屈亮 on 2018/7/5.
//  Copyright © 2018年 屈亮. All rights reserved.
//

#import "BaseViewController.h"

@interface SEViewController : BaseViewController
@property (strong, nonatomic) UINavigationController *nav;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray *dataListArry;
@end
