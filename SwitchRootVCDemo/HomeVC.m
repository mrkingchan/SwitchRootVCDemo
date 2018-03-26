//
//  HomeVC.m
//  SwitchRootVCDemo
//
//  Created by Macx on 2018/3/26.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC ()<UITableViewDelegate,UITableViewDataSource> {
    UITableView *_tableView;
}

@end

@implementation HomeVC

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    for (UIView *subView in _tableView.subviews) {
        if ([subView isKindOfClass:[UITableViewCell class]]) {
            // 一个一个的cell
            for (UIView *subsubView in subView.subviews) {
                if ([subsubView isKindOfClass:NSClassFromString(@"UITableViewCellContentView")]) {
                    //contentView
                } else if ([subsubView isKindOfClass:NSClassFromString(@"UITableViewCellSeparatorView")]) {
                    //分割线
                }
            }
            
        } else if ([subView isKindOfClass:[UIImageView class]] ) {
            // 下边和右边的滚动条
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 88, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 88)
                                               style:0];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    if ([UIDevice currentDevice].systemVersion.floatValue >=11.0) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

- (void)back {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"index_%zd",indexPath.row];
    return cell;
}
@end
