//
//  UIImage+RevanImage.m
//  01-modularization
//
//  Created by 紫荆秋雪 on 2017/4/16.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "UIImage+RevanImage.h"

@implementation UIImage (RevanImage)

+ (UIImage *)revan_originImageWithName:(NSString *)name {
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (UIImage *)revan_circleImage {
    CGSize size = self.size;
    CGFloat drawWH = size.width < size.height ? size.width : size.height;
    
    ///开启图形上下文
    UIGraphicsBeginImageContext(CGSizeMake(drawWH, drawWH));
    ///绘制一个圆形区域，进行裁剪
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect clipRect = CGRectMake(0, 0, drawWH, drawWH);
    CGContextAddEllipseInRect(context, clipRect);
    CGContextClip(context);
    ///绘制大图片
    CGRect drawRect = CGRectMake(0, 0, size.width, size.height);
    [self drawInRect:drawRect];
    ///取出结果图片
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    ///关闭上下文
    UIGraphicsEndImageContext();
    return resultImage;
}

/**
 通过路径加载组件中的图片资源
 
 @param imageName 图片名称
 @param bundle 图片所在bundle
 @param Class 图片所在类
 @return 图片
 */
+ (instancetype)revan_imageName:(NSString *)imageName inDirectoryBundleName:(NSString *)bundleName commandClass:(Class)Class {
    /** 屏幕比 */
    NSInteger scale = (NSInteger)[[UIScreen mainScreen] scale];
    /** 当前Bundle */
    NSBundle *currentBundle = [NSBundle bundleForClass:Class];
    /** 图片完整名称 */
    NSString *name = [NSString stringWithFormat:@"%@@%zdx",imageName,scale];
    /** 图片所属bundle */
    NSString *bundleNames = [NSString stringWithFormat:@"%@.bundle",bundleName];
    /** 图片资源路径 */
    NSString *imagePath = [currentBundle pathForResource:name ofType:@"png" inDirectory:bundleNames];
    return imagePath ? [UIImage imageWithContentsOfFile:imagePath] : nil;
}


@end
