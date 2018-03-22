//
//  SuperNaviVC.m
//  SwitchRootVCDemo
//
//  Created by Macx on 2018/3/22.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "SuperNaviVC.h"

@interface SuperNaviVC ()

@end

@implementation SuperNaviVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[UINavigationBar appearance]setBackgroundImage:[[UIImage imageNamed:@"nav_bg"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forBarMetrics:UIBarMetricsDefault];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count>=1) {
        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(next)];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    NSLog(@"viewControllers = %@",self.viewControllers);

    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return [super popViewControllerAnimated:animated];
}

- (void)next {
    UIViewController *VC = [UIViewController new];
    VC.view.backgroundColor = [UIColor orangeColor];
    [self pushViewController:VC animated:YES];
}


@end
