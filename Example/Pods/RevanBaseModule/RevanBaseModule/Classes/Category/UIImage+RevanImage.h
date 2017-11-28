//
//  UIImage+RevanImage.h
//  01-modularization
//
//  Created by 紫荆秋雪 on 2017/4/16.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RevanImage)

+ (UIImage *)revan_originImageWithName:(NSString *)name;

- (UIImage *)revan_circleImage;

@end
