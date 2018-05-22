//
//  FCCountDownView.m
//  7MinutesWorkout
//
//  Created by Mostafizur Rahman on 14/5/18.
//  Copyright © 2018 Mostafizur Rahman. All rights reserved.
//

#import "FCCountDownView.h"

#define HF_W [[UIScreen mainScreen] bounds].size.width / 2
#define HF_H [[UIScreen mainScreen] bounds].size.height / 2

@interface FCCountDownView()<CAAnimationDelegate>{
    NSInteger countDown;
    NSTimer *downTimer;
    CALayer *animationLayer;
    CAAnimationGroup *groupAnimation;
    CGFloat completedParcentage;
    CAGradientLayer *gradientLayer;
}
@end
@implementation FCCountDownView

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    animationLayer = [CALayer layer];
    animationLayer.hidden = YES;
    animationLayer.backgroundColor = [UIColor whiteColor ].CGColor;
    CGFloat maxWH = sqrt(HF_W * HF_W + HF_H * HF_H) ;
    animationLayer.frame = CGRectMake(0, 0, maxWH * 2, maxWH * 2);
    animationLayer.position = CGPointMake( HF_W,  HF_H);
    animationLayer.cornerRadius = maxWH;
    animationLayer.masksToBounds = YES;
    animationLayer.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7].CGColor;
    [self.layer insertSublayer:animationLayer atIndex:0];
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)startAnimation:(BOOL)shouldAnimate{
    
    if (shouldAnimate){
        self.hidden = NO;
        animationLayer.hidden = NO;
        [CATransaction begin];
        [CATransaction setAnimationDuration:0.9];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
        animationLayer.transform = CATransform3DMakeScale(1, 1, 1);
        [CATransaction commit];
        countDown = 3;
        [self.logoAnimationView animateTextLayerWith:[ NSString stringWithFormat:@"%ld", (long)countDown]];
        downTimer = [NSTimer scheduledTimerWithTimeInterval:1.2
                                                     target:self
                                                   selector:@selector(downCount:)
                                                   userInfo:nil
                                                    repeats:YES];
        
    } else {
        [[self superview] sendSubviewToBack:self];
        self.hidden = YES;
        animationLayer.transform = CATransform3DMakeScale(0.001, 0.001, 1);
    }
}

-(void)downCount:(NSTimer *)timer{
    [self.logoAnimationView animateTextLayerWith:[NSString stringWithFormat:@"%ld", (long)--countDown]];
    if(countDown == -1){
        [downTimer invalidate];
        [self.pushDelegate didPushToNextViewController];
//        if([self.pushDelegate respondsToSelector:@selector(didPushToNextViewController)]){
//            [self.pushDelegate didPushToNextViewController];
//        }
    }
}

@end
