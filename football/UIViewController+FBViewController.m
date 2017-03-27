//
//  UIViewController+FBViewController.m
//  football
//
//  Created by xiaoxian on 2017/3/27.
//  Copyright © 2017年 sopig.cn. All rights reserved.
//

#import "UIViewController+FBViewController.h"
#import <objc/runtime.h>
@implementation UIViewController (FBViewController)

+ (void)FBUIViewController
{
    Method appearMethod = class_getInstanceMethod([self class], @selector(viewDidAppear:));
    Method hookMethod = class_getInstanceMethod([self class], @selector(hook_ViewDidAppear:));
    method_exchangeImplementations(appearMethod, hookMethod);
}



- (void)hook_ViewDidAppear:(BOOL)animated
{
    NSString *appearDetailInfo = [NSString stringWithFormat:@" %@ - %@", NSStringFromClass([self class]), @"didAppear"];
    NSLog(@"%@", appearDetailInfo);
    [self hook_ViewDidAppear:animated];
}

@end
