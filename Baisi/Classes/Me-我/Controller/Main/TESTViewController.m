//
//  TESTViewController.m
//  Baisi
//
//  Created by dqong on 2017/7/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "TESTViewController.h"
#import "ZYFoldingTableView.h"
#import "ZYTestViewController.h"

@interface TESTViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIButton       * navBtn;
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, assign) ZYFoldingSectionHeaderArrowPosition arrowPosition;

@end

@implementation TESTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    self.navBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.navBtn setTitle:@"设置" forState:UIControlStateNormal];
    [self.navBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.navBtn.frame = CGRectMake(0, 0, 40, 40);
    [self.navBtn addTarget:self action:@selector(navClicks:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * buttom = [[UIBarButtonItem alloc]initWithCustomView:self.navBtn];
    self.navigationItem.rightBarButtonItem = buttom;
}
- (void)navClicks:(UIButton *)btn{
    btn.selected = !btn.selected;
    [self tableEdit:btn.selected];

}
- (void)tableEdit:(BOOL)is{
    if (self.tableView.editing == YES) {
        [self.tableView setEditing:NO animated:YES];
    }else{
        [self.tableView setEditing:YES animated:YES];
    }

}
// 创建tableView
- (void)setupTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITableView *tableView = [[ZYFoldingTableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
    _tableView = tableView;
    tableView.rowHeight = 50;
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = [NSString stringWithFormat:@"test %ld (%@)",indexPath.row + 1, indexPath.row ? @"默认展开" : @"默认关闭"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYTestViewController *testVc = [[ZYTestViewController alloc] init];
    testVc.arrowPosition = indexPath.row;
    [self.navigationController pushViewController:testVc animated:YES];
}


@end
