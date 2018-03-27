//
//  TabbarVC.m
//  SwitchRootVCDemo
//
//  Created by Macx on 2018/3/26.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "TabbarVC.h"
#import "Tabbar.h"
#import "HomeVC.h"

@interface TabbarVC ()

@end

@implementation TabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *naviControllers = [NSMutableArray new];
    for (int i = 0; i < 4; i ++) {
        UIViewController *viewConroller = [self viewControllerWithTitle:[NSString stringWithFormat:@"title_%d",i + 1] normalImage:[UIImage imageNamed:@"tabbar_1"]
                                                          selectedImage:[UIImage imageNamed:@"tabbar_1"]];
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:viewConroller];
        [naviControllers addObject:navi];
    }
    self.viewControllers = naviControllers;
    Tabbar *tabbar =[Tabbar new];
    //中间按钮点击
    tabbar.completeBlock = ^{
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:[HomeVC new]];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navi animated:YES completion:nil];
    };
    [self setValue:tabbar forKey:@"tabBar"];
}

////UIViewController
- (UIViewController *)viewControllerWithTitle:(NSString*)titleStr
                                  normalImage:(UIImage *)normalImage
                                selectedImage:(UIImage *)selectedImage {
    UIViewController *viewController = [UIViewController new];
    viewController.navigationItem.title = titleStr;
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:titleStr
                                                       image:[normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:
                          [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    viewController.tabBarItem = item;
    return viewController;
}

@end
