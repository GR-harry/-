//
//  PresentAnimater.m
//  手势移除控制器
//
//  Created by GR on 15/8/31.
//  Copyright (c) 2015年 GR. All rights reserved.
//

#import "PresentAnimater.h"

@implementation PresentAnimater
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // 1. 获取源控制器和目标控制器
    UIViewController *scVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. 添加目标控制器的view
    CGRect scFrame = scVc.view.frame;
    CGRect toFrame = scFrame;
    toFrame.origin.x = toFrame.size.width;
    toVc.view.frame = toFrame;
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVc.view];
    
    // 3. 动画 源控制器的View缩小 --> 目标控制器推入
    CGFloat boder = 20;
    CGFloat duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        scVc.view.alpha = 0.5f;
        scVc.view.frame = CGRectMake(boder, boder, scFrame.size.width - 2 * boder, scFrame.size.height - 2 * boder);
        toVc.view.frame = scFrame;
    } completion:^(BOOL finished) {
        //        [scVc.view removeFromSuperview];
        NSLog(@"%@", containerView.subviews);
        [transitionContext completeTransition:YES];
        NSLog(@"%@", containerView.subviews);
    }];
    
}
@end
