//
//  DiscoverViewController.m
//  Tabbar_Test
//
//  Created by 屈亮 on 2018/7/5.
//  Copyright © 2018年 屈亮. All rights reserved.
//
//导航默认颜色
#define NAVGATION_COLOR [UIColor colorWithRed:45.0/255.0 green:180.0/255.0 blue:145.0/255.0 alpha:1.0]
#import "DiscoverViewController.h"
#import "SEViewController.h"
#import "SETableViewCell.h"
#import "AppDelegate.h"
#import "SETextViewController.h"
@interface DiscoverViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchControllerDelegate>
@property (nonatomic, strong)UITableView *discoverTableV;
@property (nonatomic, strong)UISearchController *searchVC;
@property (strong, nonatomic)SEViewController *seVC;
@end

@implementation DiscoverViewController

- (UITableView *)discoverTableV
{
    if (!_discoverTableV) {
        _discoverTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
        _discoverTableV.delegate = self;
        _discoverTableV.dataSource = self;
    }
    return _discoverTableV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.discoverTableV];
    self.seVC = [[SEViewController alloc] init];
    self.searchVC = [[UISearchController alloc] initWithSearchResultsController:self.seVC];
    self.searchVC.searchResultsUpdater = self.seVC;
    self.searchVC.delegate = self;
    self.searchVC.view.backgroundColor = [UIColor whiteColor];
    self.searchVC.searchBar.delegate = self;
    [self.searchVC.searchBar sizeToFit];
    self.searchVC.searchBar.placeholder = @"搜索";
    self.searchVC.searchBar.tintColor = NAVGATION_COLOR;
    self.searchVC.dimsBackgroundDuringPresentation = NO;
//    if (@available(iOS 11.0, *)) {
//        self.navigationItem.searchController = self.searchVC;
//    } else {
        self.discoverTableV.tableHeaderView = self.searchVC.searchBar;
//    }
    self.definesPresentationContext = YES;
    self.seVC.nav = self.navigationController;
    self.seVC.searchBar = self.searchVC.searchBar;
    
    
    self.discoverTableV.rowHeight = 50;
    self.discoverTableV.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    return cell;
    
}
#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
    for (id obj in [searchBar subviews]) {
        if ([obj isKindOfClass:[UIView class]]) {
            for (id obj2 in [obj subviews]) {
                if ([obj2 isKindOfClass:[UIButton class]]) {
                    UIButton *btn = (UIButton *)obj2;
                    [btn setTitle:@"取消" forState:UIControlStateNormal];
                }
            }
        }
    }
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    SETextViewController *textVC = [[SETextViewController alloc] init];
    [self.navigationController pushViewController:textVC animated:YES];
}

#pragma mark - UISearchControllerDelegate代理
//测试UISearchController的执行过程
- (void)willPresentSearchController:(UISearchController *)searchController {
    NSLog(@"willPresentSearchController");
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate tabbarHidden:YES];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    NSLog(@"didPresentSearchController");
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    //产生100个数字+三个随机字母
    for (NSInteger i =0; i<100; i++) {
        [arr addObject:[NSString stringWithFormat:@"%ld%@",(long)i,[self shuffledAlphabet]]];
    }
    NSLog(@"arr.count===%d",arr.count);
    self.seVC.dataListArry = arr;
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    NSLog(@"willDismissSearchController");
}

- (void)didDismissSearchController:(UISearchController *)searchController {
    NSLog(@"didDismissSearchController");
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate tabbarHidden:NO];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)presentSearchController:(UISearchController *)searchController {
    NSLog(@"presentSearchController");
}
//产生3个随机字母
- (NSString *)shuffledAlphabet {
    NSMutableArray * shuffledAlphabet = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"]];
    
    NSString *strTest = [[NSString alloc]init];
    for (int i=0; i<3; i++) {
        int x = arc4random() % 25;
        strTest = [NSString stringWithFormat:@"%@%@",strTest,shuffledAlphabet[x]];
    }
    return strTest;
}
@end
