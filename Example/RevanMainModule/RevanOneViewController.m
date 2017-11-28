//
//  RevanOneViewController.m
//  RevanMainModule_Example
//
//  Created by 紫荆秋雪 on 2017/11/28.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "RevanOneViewController.h"
#import "RevanTwoViewController.h"

@interface RevanOneViewController ()

@end

@implementation RevanOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//        self.view.tag = 666;
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    NSLog(@"摸到我了");
    static BOOL isPlay = NO;
    isPlay = !isPlay;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playState" object:@(isPlay)];
    UIImage *image = [UIImage imageNamed:@"zxy_icon"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playImage" object:image];
    //
    [self.navigationController pushViewController:[RevanTwoViewController new] animated:YES];
}
@end
