//
//  ViewController.m
//  手势移除控制器
//
//  Created by GR on 15/8/31.
//  Copyright (c) 2015年 GR. All rights reserved.
//

#import "ViewController.h"
#import "RedViewController.h"
#import "PresentAnimater.h"
#import "DismissAnimater.h"
#import "DismissInteractiveTranstion.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) PresentAnimater *presentAnimater;
@property (nonatomic, strong) DismissAnimater *dismissAnimater;
@property (nonatomic, strong) DismissInteractiveTranstion *dimissInteractiveTranstion;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.presentAnimater = [[PresentAnimater alloc] init];
    self.dismissAnimater = [[DismissAnimater alloc] init];
    
    self.view.backgroundColor = [UIColor blueColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"Click me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)buttonClicked:(UIButton *)btn
{
    RedViewController *redVC = [[RedViewController alloc] init];
    redVC.transitioningDelegate = self;
    self.dimissInteractiveTranstion = [[DismissInteractiveTranstion alloc] initWithController:redVC];
    [self presentViewController:redVC animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimater;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimater;
}
- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.dimissInteractiveTranstion.interacting ? self.dimissInteractiveTranstion : nil;
}
@end
