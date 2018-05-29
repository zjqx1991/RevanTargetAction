//
//  RevanTargetAction+RevanMainAPI.h
//  RevanMainModule_Example
//
//  Created by 紫荆秋雪 on 2018/5/29.
//  Copyright © 2018年 Revan. All rights reserved.
//

#import "RevanTargetAction.h"

@interface RevanTargetAction (RevanMainAPI)

/**
 获取根控制器

 @return 根控制器
 */
+ (UIViewController *)revan_getRootViewController;


/**
 添加子控制器
 
 @param vc                子控制器
 @param normalImageName   普通状态下图片
 @param selectedImageName 选中图片
 @param isRequired        是否需要包装导航控制器
 */
+ (void)revan_addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;

@end
