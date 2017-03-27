//
//  UIApplication+FBApplication.m
//  football
//
//  Created by xiaoxian on 2017/3/27.
//  Copyright © 2017年 sopig.cn. All rights reserved.
//

#import "UIApplication+FBApplication.h"
#import <objc/runtime.h>
@implementation UIApplication (FBApplication)

+ (void)FBUIApplication
{
    Method controlMethod = class_getInstanceMethod([UIApplication class], @selector(sendAction:to:from:forEvent:));
    Method hookMethod = class_getInstanceMethod([self class], @selector(hook_sendAction:to:from:forEvent:));
    method_exchangeImplementations(controlMethod, hookMethod);
}

- (BOOL)hook_sendAction:(SEL)action to:(nullable id)target from:(nullable id)sender forEvent:(nullable UIEvent *)event;
{
    NSString *actionDetailInfo = [NSString stringWithFormat:@" %@ - %@ - %@", NSStringFromClass([target class]), NSStringFromClass([sender class]), NSStringFromSelector(action)];
    NSLog(@"%@", actionDetailInfo);
    return [self hook_sendAction:action to:target from:sender forEvent:event];
}


@end
