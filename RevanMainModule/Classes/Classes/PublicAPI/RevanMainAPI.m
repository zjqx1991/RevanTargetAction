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


/**
 添加子控制器
 
 @param params 参数顺序
 [0] vc                子控制器
 [1] normalImageName   普通状态下图片
 [2] selectedImageName 选中图片
 [3] isRequired        是否需要包装导航控制器
 */
+ (void)revanAPI_addChildVC:(NSArray *)params {
    UIViewController *vc = params[0];
    NSString *nImg = params[1];
    NSString *sImg = params[2];
    BOOL isRequired = params[3];
    
    [self revanAPI_addChildVC:vc normalImageName:nImg selectedImageName:sImg isRequiredNavController:isRequired];
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
