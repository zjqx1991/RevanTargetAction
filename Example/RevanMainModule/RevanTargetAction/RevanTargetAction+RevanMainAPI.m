//
//  RevanTargetAction+RevanMainAPI.m
//  RevanMainModule_Example
//
//  Created by 紫荆秋雪 on 2018/5/29.
//  Copyright © 2018年 Revan. All rights reserved.
//

#import "RevanTargetAction+RevanMainAPI.h"

//RevanMainAPI组件API类
static NSString * const RevanMainAPI = @"RevanMainAPI";

@implementation RevanTargetAction (RevanMainAPI)

/**
 获取根控制器
 
 @return 根控制器
 */
+ (UIViewController *)revan_getRootViewController {
    return [self revan_performTargetClass:RevanMainAPI action:@"revanAPI_rootTabBarController" params:nil isRequiredReturnValue:YES];
}


/**
 添加子控制器
 
 @param vc                子控制器
 @param normalImageName   普通状态下图片
 @param selectedImageName 选中图片
 @param isRequired        是否需要包装导航控制器
 */
+ (void)revan_addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    NSArray *params = @[vc, normalImageName, selectedImageName, @(isRequired)];
    [self revan_performTargetClass:RevanMainAPI action:@"revanAPI_addChildVC:" params:params isRequiredReturnValue:NO];
}


@end
