//
//  SEViewController.m
//  Tabbar_Test
//
//  Created by 屈亮 on 2018/7/5.
//  Copyright © 2018年 屈亮. All rights reserved.
//

#import "SEViewController.h"
#import "AppDelegate.h"
#import "SETableViewCell.h"
@interface SEViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *seTableV;
@property (strong, nonatomic) NSMutableArray *searchList;//满足搜索条件的数组
@end

@implementation SEViewController
- (UITableView *)seTableV
{
    if (!_seTableV) {
        _seTableV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _seTableV.delegate = self;
        _seTableV.dataSource = self;
        [_seTableV registerClass:[SETableViewCell class] forCellReuseIdentifier:@"SETableViewCell"];
        _seTableV.tableFooterView = [[UIView alloc] init];
    }
    return _seTableV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataListArry = [NSMutableArray new];
    self.searchList = [NSMutableArray new];
    
    self.automaticallyAdjustsScrollViewInsets = NO;//不加的话，table会下移
    self.edgesForExtendedLayout = UIRectEdgeNone;//不加的话，UISearchBar返回后会上移
    [self.view addSubview:self.seTableV];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchList.count > 0 ?self.searchList.count:1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.searchList.count > 0 ?40:200;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    if (self.searchList.count > 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
        cell.textLabel.text = self.searchList[indexPath.row];
        return cell;
    }
    SETableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SETableViewCell" forIndexPath:indexPath];
    return cell;
}
#pragma mark - tableView
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.searchBar resignFirstResponder];
}
#pragma mark - UISearchResultsUpdating
//每输入一个字符都会执行一次
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"搜索关键字：%@",searchController.searchBar.text);
    searchController.searchResultsController.view.hidden = NO;
    
    //谓词搜索
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchController.searchBar.text];
    if (self.searchList!= nil) {
        [self.searchList removeAllObjects];
    }

    //过滤数据
    self.searchList = [NSMutableArray arrayWithArray:[_dataListArry filteredArrayUsingPredicate:preicate]];
//    //刷新表格
    NSLog(@"--%d",self.dataListArry.count);
    [self.seTableV reloadData];
}
@end
