//
//  ViewController.m
//  countDown
//
//  Created by Paradox Lab on 5/21/18.
//  Copyright © 2018 Paradox Lab. All rights reserved.
//

#import "ViewController.h"
#import "secondVC.h"
#import "FCCountDownView.h"

@interface ViewController ()<PushVCDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.aview startAnimation:NO];
    self.aview.pushDelegate = self;
}

-(void)viewDidAppear:(BOOL)animated{
    [self.aview startAnimation:YES];
}


- (void)didPushToNextViewController {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    secondVC *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"second"];
    [self.navigationController pushViewController:vc animated:true];
}

@end
