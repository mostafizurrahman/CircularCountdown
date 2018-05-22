//
//  FCLogoAnimationView.m
//  7MinutesWorkout
//
//  Created by Mostafizur Rahman on 14/5/18.
//  Copyright © 2018 Mostafizur Rahman. All rights reserved.
//

#import "FCLogoAnimationView.h"

#define HF_W self.frame.size.width / 2
#define HF_H self.frame.size.height / 2
@interface FCLogoAnimationView(){
    CATextLayer* upperOperator;
}
@end
@implementation FCLogoAnimationView

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = [NSArray arrayWithObjects:(__bridge id)[[UIColor magentaColor] CGColor], (__bridge id)[[UIColor cyanColor] CGColor], nil];
    gradient.frame = self.bounds;
    gradient.cornerRadius = HF_H;
    gradient.masksToBounds = YES;
    [self.layer insertSublayer:gradient atIndex:0];
    
    upperOperator = [[CATextLayer alloc] init];
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGFloat components1[4] = {1.0, 1.0, 1.0, 1.0};
    CGColorRef almostWhite = CGColorCreate(space,components1);
    upperOperator.contentsScale = UIScreen.mainScreen.scale;
    upperOperator.bounds = CGRectMake(0, 0, 50, 50);
    upperOperator.foregroundColor = almostWhite;
    CGColorRelease(almostWhite);
    CGFloat  components2[4] = {0.0, 0.0, 0.0, 0.0};
    almostWhite = CGColorCreate(space,components2);
    upperOperator.backgroundColor = almostWhite;
    CGColorRelease(almostWhite);
    CGColorSpaceRelease(space);
    upperOperator.position = CGPointMake(HF_W, -HF_H / 2);
    upperOperator.font = (__bridge CFTypeRef _Nullable)(@"Helvetica-Bold");
    upperOperator.fontSize = 45.0f;
    upperOperator.alignmentMode = kCAAlignmentCenter;
    [self.layer addSublayer:upperOperator];
    
    return self;
}

-(void)animateTextLayerWith:(NSString *)text{
   
    upperOperator.string = text;
    upperOperator.hidden = NO;
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.1];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [CATransaction setCompletionBlock:^{
        upperOperator.hidden = YES;
        upperOperator.transform = CATransform3DMakeTranslation(0, -HF_H * 0.75, 0);
    }];
    upperOperator.transform = CATransform3DMakeTranslation(0, HF_H * 1.5, 0);
    [CATransaction commit];
    
    
}

@end
