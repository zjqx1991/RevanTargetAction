//
//  RevanMiddleView.h
//  RevanMainModule_Example
//
//  Created by 紫荆秋雪 on 2017/11/27.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RevanMiddleView : UIView

+ (instancetype)shareInstance;

/**
 快速创建中间视图
 
 @return 中间的视图
 */
+ (instancetype)middleView;

/**
 更新中间图片

 @param middleImage 中间图片
 */
- (void)revan_updateMiddleImage:(UIImage *)middleImage;

/**
 控制是否正在播放
 */
@property (nonatomic, assign) BOOL isPlaying;

/**
 点击中间按钮的执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);


@end
