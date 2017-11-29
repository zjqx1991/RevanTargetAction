//
//  UIImage+RevanImage.h
//  01-modularization
//
//  Created by 紫荆秋雪 on 2017/4/16.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RevanImage)

/**
 使图片原图显示
 */
+ (UIImage *)revan_originImageWithName:(NSString *)name;

/**
 图片切圆
 */
- (UIImage *)revan_circleImage;

/**
 通过路径加载组件中的图片资源

 @param imageName 图片名称
 @param bundleName 图片所在bundle(RRR.bundle,只需传RRR)
 @param Class 图片所在类
 @return 图片
 */
+ (instancetype)revan_imageName:(NSString *)imageName inDirectoryBundleName:(NSString *)bundleName commandClass:(Class)Class;

@end
