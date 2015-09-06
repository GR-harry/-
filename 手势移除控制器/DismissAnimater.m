
//
//  DismissAnimater.m
//  手势移除控制器
//
//  Created by GR on 15/8/31.
//  Copyright (c) 2015年 GR. All rights reserved.
//

#import "DismissAnimater.h"

@implementation DismissAnimater
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *scVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect scFrame = scVc.view.frame;
    CGRect toFrame = scFrame;
    toFrame.origin.x = scFrame.size.width;
    
    toVc.view.frame = CGRectInset(scFrame, 20, 20);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVc.view];
    [containerView sendSubviewToBack:toVc.view];
    
    CGFloat duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        scVc.view.frame = toFrame;
        toVc.view.frame = scFrame;
        toVc.view.alpha = 1;
    } completion:^(BOOL finished) {
        // NO : 会还原动画前所有View的位置。
        NSLog(@"%ld", containerView.subviews.count);
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        NSLog(@"%ld", containerView.subviews.count);
    }];

}
@end
