//
//  UINavigationController+FBNavigation.m
//  football
//
//  Created by xiaoxian on 2017/3/27.
//  Copyright © 2017年 sopig.cn. All rights reserved.
//

#import "UINavigationController+FBNavigation.h"
#import <objc/runtime.h>
@implementation UINavigationController (FBNavigation)
+ (void)FBNavigation_push
{
    Method pushMethod = class_getInstanceMethod([self class], @selector(pushViewController:animated:));
    Method hookMethod = class_getInstanceMethod([self class], @selector(hook_pushViewController:animated:));
    method_exchangeImplementations(pushMethod, hookMethod);
}

+ (void)FBNavigation_pop
{
    Method popMethod = class_getInstanceMethod([self class], @selector(popViewControllerAnimated:));
    Method hookMethod = class_getInstanceMethod([self class], @selector(hook_popViewControllerAnimated:));
    method_exchangeImplementations(popMethod, hookMethod);
}


- (void)hook_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
     NSString *popDetailInfo = [NSString stringWithFormat: @"%@ - %@ - %@", NSStringFromClass([self class]), @"push", NSStringFromClass([viewController class])];
    NSLog(@"%@", popDetailInfo);
    [self hook_pushViewController:viewController animated:animated];
}


- (void)hook_popViewControllerAnimated:(BOOL)animated
{
    NSString *popDetailInfo = [NSString stringWithFormat:@"%@ - %@", NSStringFromClass([self class]), @"pop"];
    NSLog(@"%@", popDetailInfo);
    [self hook_popViewControllerAnimated:animated];
}

@end
