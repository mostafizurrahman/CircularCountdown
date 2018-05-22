//
//  FCCountDownView.h
//  7MinutesWorkout
//
//  Created by Mostafizur Rahman on 14/5/18.
//  Copyright © 2018 Mostafizur Rahman. All rights reserved.
//

//#import "FCBaseTableView.h"
#import "FCLogoAnimationView.h"
#import <UIKit/UIKit.h>

@protocol PushVCDelegate<NSObject>
-(void)didPushToNextViewController;
@end

@interface FCCountDownView : UIView
@property (weak, nonatomic) IBOutlet  FCLogoAnimationView *logoAnimationView;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;

-(void)startAnimation:(BOOL)shouldAnimate;
@property (readwrite, weak) id<PushVCDelegate> pushDelegate;
@end
