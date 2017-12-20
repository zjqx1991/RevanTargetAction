//
//  RevanMainAPI.m
//  Pods-RevanMainModule_Example
//
//  Created by 紫荆秋雪 on 2017/12/21.
//

#import "RevanMainAPI.h"
#import "RevanTabBarController.h"
#import "RevanTabBar.h"
#import "RevanNavigationBar.h"
#import "RevanMiddleView.h"


@implementation RevanMainAPI

+ (RevanTabBarController *)revanAPI_rootTabBarController {
    return [RevanTabBarController shareInstance];
}


+ (void)revanAPI_addChildVC:(UIViewController *)vc normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired {
    
    [[RevanTabBarController shareInstance] revan_addChildVC:vc normalImageName:normalImageName selectedImageName:selectedImageName isRequiredNavController:isRequired];
    
}


+ (void)revanAPI_setTabbarMiddleBtnClick: (void(^)(BOOL isPlaying))middleClickBlock {
    
    RevanTabBar *tabbar = (RevanTabBar *)[RevanTabBarController shareInstance].tabBar;
    tabbar.middleClickBlock = middleClickBlock;
    
}

/**
 *  设置全局的导航栏背景图片
 *
 *  @param globalImg 全局导航栏背景图片
 */
+ (void)revanAPI_setNavBarGlobalBackGroundImage: (UIImage *)globalImg {
    [RevanNavigationBar revan_setGlobalBackGroundImage:globalImg];
}
/**
 *  设置全局导航栏标题颜色, 和文字大小
 *
 *  @param globalTextColor 全局导航栏标题颜色
 *  @param fontSize        全局导航栏文字大小
 */
+ (void)revanAPI_setNavBarGlobalTextColor: (UIColor *)globalTextColor andFontSize: (CGFloat)fontSize {
    
    [RevanNavigationBar revan_setGlobalTextColor:globalTextColor andFontSize:fontSize];
    
}

+ (UIView *)middleView {
    return [RevanMiddleView middleView];
}
@end
