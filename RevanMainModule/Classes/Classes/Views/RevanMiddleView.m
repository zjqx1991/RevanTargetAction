//
//  RevanMiddleView.m
//  RevanMainModule_Example
//
//  Created by 紫荆秋雪 on 2017/11/27.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "RevanMiddleView.h"
#import "CALayer+RevanLayerAimate.h"


/**
 加载 mainBundle中的xib文件
 @param xibName xib文件名称
 */
#define RevanLoadingMainNib(xibName) [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] firstObject]

/**
 加载组件中的xib文件
 
 @param Class xib当前类
 @param xibName xib文件名称
 */
#define RevanLoadingCurrentNib(Class, xibName) [[[NSBundle bundleForClass:Class] loadNibNamed:xibName owner:nil options:nil] firstObject]

/** 当前bundle */
#define RevanCurrentBundle(Class) [NSBundle bundleForClass:Class]
/** 当前屏幕比例 */
#define RevanScreenScale (NSInteger)[UIScreen mainScreen].scale
/** 图片路径 */
#define RevanImagePath(Class ,imageName, bundleName) [[NSBundle bundleForClass:Class] pathForResource:[NSString stringWithFormat:@"%@@%zdx.png", imageName, RevanScreenScale] ofType:nil inDirectory:[NSString stringWithFormat:@"%@.bundle", bundleName]]



@interface RevanMiddleView()
/** 背景阴影图片 */
@property (weak, nonatomic) IBOutlet UIImageView *middleBgShadowImageView;
/** 正常情况下图片 */
@property (weak, nonatomic) IBOutlet UIImageView *middleBgNormalImageView;
/** 正常情况下播放标识 */
@property (weak, nonatomic) IBOutlet UIImageView *middleBgPlayImageView;
/** 当前正在播放图片 */
@property (weak, nonatomic) IBOutlet UIImageView *middleCurrentPlayingImageView;
/** 播放按钮 */
@property (weak, nonatomic) IBOutlet UIButton *playButton;
/** 中间图片 */
@property (nonatomic, strong) UIImage *middleImage;
@end


@implementation RevanMiddleView

static RevanMiddleView *share_Instance;

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (instancetype)shareInstance {
    if (share_Instance == nil) {
        share_Instance = [RevanMiddleView middleView];
    }
    return share_Instance;
}

+ (instancetype)middleView {
    
    NSBundle *currenBundle = [NSBundle bundleForClass:self];
    RevanMiddleView *middleView = [[currenBundle loadNibNamed:@"RevanMiddleView" owner:nil options:nil] firstObject];
    return middleView;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.middleCurrentPlayingImageView.layer.masksToBounds = YES;
    self.middleImage = self.middleCurrentPlayingImageView.image;
    
    [self.middleCurrentPlayingImageView.layer removeAnimationForKey:@"playAnnimation"];
    CABasicAnimation *basicAnnimation = [[CABasicAnimation alloc] init];
    basicAnnimation.keyPath = @"transform.rotation.z";
    basicAnnimation.fromValue = @0;
    basicAnnimation.toValue = @(M_PI * 2);
    basicAnnimation.duration = 30;
    basicAnnimation.repeatCount = MAXFLOAT;
    basicAnnimation.removedOnCompletion = NO;
    [self.middleCurrentPlayingImageView.layer addAnimation:basicAnnimation forKey:@"playAnnimation"];
    
    [self.middleCurrentPlayingImageView.layer revan_pauseAnimate];
    
    
    [self.playButton addTarget:self action:@selector(playButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 监听播放状态的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isPlayerPlay:) name:@"playState" object:nil];
    
    // 监听播放图片的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setPlayImage:) name:@"playImage" object:nil];
    
    NSString *imgPath = RevanImagePath([self class], @"tabbar_np_normal", @"RevanMainModule");
    self.middleBgNormalImageView.image = [UIImage imageWithContentsOfFile:imgPath];
    
    self.middleBgShadowImageView.image = [UIImage imageWithContentsOfFile:RevanImagePath([self class] ,@"tabbar_np_shadow", @"RevanMainModule")];
    
    self.middleBgPlayImageView.image = [UIImage imageWithContentsOfFile:RevanImagePath([self class] ,@"tabbar_np_playshadow", @"RevanMainModule")];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = self.frame.size.width * 0.5;
    self.layer.masksToBounds = YES;
}

/** 更新中间图片 */
- (void)revan_updateMiddleImage:(UIImage *)middleImage {
    self.middleImage = middleImage;
    self.middleCurrentPlayingImageView.image = middleImage;
}


- (void)playButtonClick:(UIButton *)btn {
    
    if (self.middleClickBlock) {
        self.middleClickBlock(self.isPlaying);
    }
}

- (void)setIsPlaying:(BOOL)isPlaying {
    
    if (_isPlaying == isPlaying) {
        return;
    }
    _isPlaying = isPlaying;
    if (isPlaying) {
        [self.playButton setImage:nil forState:UIControlStateNormal];
        [self.middleCurrentPlayingImageView.layer revan_resumeAnimate];
        
    }else {
        UIImage *image = [UIImage imageNamed:@"tabbar_np_play"];
        [self.playButton setImage:image forState:UIControlStateNormal];
        [self.middleCurrentPlayingImageView.layer revan_pauseAnimate];
    }
}



#pragma mark - 监听通知方法
- (void)isPlayerPlay:(NSNotification *)notification {
    BOOL isPlay = [notification.object boolValue];
    self.isPlaying = isPlay;
}

- (void)setPlayImage:(NSNotification *)notification {
    UIImage *image = notification.object;
    self.middleImage = image;
}


@end
