//
//  RevanTargetAction.m
//  RevanMainModule_Example
//
//  Created by 紫荆秋雪 on 2018/5/29.
//  Copyright © 2018年 Revan. All rights reserved.
//

#import "RevanTargetAction.h"
#import <objc/runtime.h>


#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


@implementation RevanTargetAction

+ (id)revan_performTargetClass:(NSString *)targetName action:(NSString *)actionName params:(id)params isRequiredReturnValue: (BOOL)isRequiredReturnValue {
    // 1. 获取目标
    Class targetClass = NSClassFromString(targetName);
    if (targetClass == nil) {
        NSLog(@"目标不存在");
        return nil;
    }
    
    // 2. 获取行为
    SEL sel = NSSelectorFromString(actionName);
    if (sel == nil) {
        NSLog(@"行为不存在");
        return nil;
    }
    
    //NSObject *obj = [[targetCls alloc] init];
    if (![targetClass respondsToSelector:sel]) {
        NSLog(@"目标不存在该方法");
        return nil;
    }
    
    
    if (isRequiredReturnValue) {
        SuppressPerformSelectorLeakWarning(return [targetClass performSelector:sel withObject:params]);
    }
    else {
        SuppressPerformSelectorLeakWarning([targetClass performSelector:sel withObject:params]);
    }
    
    return nil;
}
@end
