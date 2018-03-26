//
//  Tabbar.m
//  SwitchRootVCDemo
//
//  Created by Macx on 2018/3/26.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "Tabbar.h"
#import "UIView+Position.h"

@implementation Tabbar

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIButton *middle = [[UIButton alloc] init];
    [middle setBackgroundImage:[UIImage imageNamed:@"tabbar_1"] forState:UIControlStateNormal];
    [middle addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    middle.adjustsImageWhenHighlighted = NO;
    [middle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    middle.size = CGSizeMake(self.bounds.size.width / 5.0, 80);
    middle.centerY = 10;
    middle.centerX = self.centerX;
    [self addSubview:middle];
    for (int i = 0,j = 0;i < self.subviews.count;i ++) {
        UIView*subView = self.subviews[i];
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            subView.frame = CGRectMake(self.width * j / 5.0, subView.frame.origin.y, self.width / 5.0, subView.frame.size.height);
            j ++;
            if (j==2) {
                j ++;
            }
            //了解tabbar的层次结构
            for (UIView *subsubView in subView.subviews) {
                if ([subsubView isKindOfClass:NSClassFromString(@"UITabBarButtonLabel")]) {
                    //label
                    NSLog(@"titlelabel = %@ -- %@",NSStringFromCGRect(subsubView.frame),[subsubView valueForKey:@"text"]);
                } else if ([subsubView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                    //imageView
                     NSLog(@"imageView = %@ -- %@",NSStringFromCGRect(subsubView.frame),[subsubView valueForKey:@"image"]);
                }
            }
        }
    }
}

- (void)buttonAction:(id)sender {
    if (_completeBlock) {
        _completeBlock();
    }
}
@end
