//
//  football.c
//  football
//
//  Created by xiaoxian on 2017/3/27.
//  Copyright © 2017年 sopig.cn. All rights reserved.
//

#import "football.h"
#import "UIApplication+FBApplication.h"
#import "UIViewController+FBViewController.h"
#import "UINavigationController+FBNavigation.h"


void kickFootball(void){
    [UIApplication FBUIApplication];
    [UIViewController FBUIViewController];
    [UINavigationController FBNavigation_push];
    [UINavigationController FBNavigation_pop];
}
