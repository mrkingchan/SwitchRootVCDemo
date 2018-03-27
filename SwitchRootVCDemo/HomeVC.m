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
    NSMutableArray *_dataArray;
    dispatch_source_t _timer;
    BOOL _start;
}

@end

@implementation HomeVC

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

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
    
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1ull * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        NSLog(@"来打我吖 -- currentThread = %@",[NSThread currentThread]);
    });
    dispatch_resume(_timer);
    _start = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 88, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 88)
                                               style:0];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    if ([UIDevice currentDevice].systemVersion.floatValue >=11.0) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    _dataArray = [NSMutableArray new];
    for (int i = 0; i < 20; i ++) {
        [_dataArray addObject:[NSString stringWithFormat:@"index_%d",i]];
    }
}

#pragma mark  -- back
- (void)back {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"index_%zd",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _start = !_start;
    if (_start) {
        dispatch_resume(_timer);
    }else {
        dispatch_suspend(_timer);
    }
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath  {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath  {
    [_dataArray replaceObjectAtIndex:destinationIndexPath.row withObject:_dataArray[sourceIndexPath.row]];
    [_tableView reloadData];
}
@end
