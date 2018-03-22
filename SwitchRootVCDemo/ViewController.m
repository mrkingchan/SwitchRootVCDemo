//
//  ViewController.m
//  SwitchRootVCDemo
//
//  Created by Macx on 2018/3/22.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UISwitch *_switch;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =_backColor;
    self.navigationItem.title = _titleStr;
    _switch = [[UISwitch alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, [UIScreen mainScreen].bounds.size.height / 2 - 20, 100, 40)];
    [_switch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    _switch.on = [[NSUserDefaults standardUserDefaults]boolForKey:@"key"];
    [self.view addSubview:_switch];
}

#pragma mark  -- private Method
- (void)switchAction:(UISwitch *)switcher {
    switcher.on = ! switcher.on;
    [[NSUserDefaults standardUserDefaults] setBool:switcher.on forKey:@"key"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    ViewController*VC = [ViewController new];
    VC.backColor = switcher.on ? [UIColor redColor]:[UIColor blueColor];
    VC.titleStr = switcher.on ? @"red":@"blue";
    [UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc] initWithRootViewController:VC];
}

@end
