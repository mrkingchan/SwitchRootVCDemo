//
//  Tabbar.h
//  SwitchRootVCDemo
//
//  Created by Macx on 2018/3/26.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tabbar : UITabBar

@property(nonatomic,copy) void (^completeBlock)(void);

@end
