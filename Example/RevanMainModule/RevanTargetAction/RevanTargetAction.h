//
//  RevanTargetAction.h
//  RevanMainModule_Example
//
//  Created by 紫荆秋雪 on 2018/5/29.
//  Copyright © 2018年 Revan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RevanTargetAction : NSObject

// 本地组件调用入口
+ (id)revan_performTargetClass:(NSString *)targetName action:(NSString *)actionName params:(id)params isRequiredReturnValue: (BOOL)isRequiredReturnValue;

@end
