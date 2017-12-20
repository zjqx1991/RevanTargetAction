//
//  RevanMainAPI.h
//  Pods-RevanMainModule_Example
//
//  Created by 紫荆秋雪 on 2017/12/21.
//

#import <Foundation/Foundation.h>

@interface RevanMainAPI : NSObject

#pragma mark -UITabBarController
/**
 获取根控制器
 
 @return rootTabBarCcontroller
 */
+ (UITabBarController *)revanAPI_rootTabBarController;

/**
 添加子控制器
 
 @param vc                子控制器
 @param normalImageName   普通状态下图片
 @param selectedImageName 选中图片
 @param isRequired        是否需要包装导航控制器
 */
+ (void)revanAPI_addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;

/**
 设置tabbar中间控件的点击代码块
 
 @param middleClickBlock 点击代码块
 */
+ (void)revanAPI_setTabbarMiddleBtnClick: (void(^)(BOOL isPlaying))middleClickBlock;


/**
 *  设置全局的导航栏背景图片
 *
 *  @param globalImg 全局导航栏背景图片
 */
+ (void)revanAPI_setNavBarGlobalBackGroundImage: (UIImage *)globalImg;
/**
 *  设置全局导航栏标题颜色, 和文字大小
 *
 *  @param globalTextColor 全局导航栏标题颜色
 *  @param fontSize        全局导航栏文字大小
 */
+ (void)revanAPI_setNavBarGlobalTextColor: (UIColor *)globalTextColor andFontSize: (CGFloat)fontSize;


/**
 快速获取中间按钮
 
 @return 中间按钮, 通过通知 playState , playImage 控制 播放和播放图片
 */
//+ (UIView *)middleView;
@end
