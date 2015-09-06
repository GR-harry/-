//
//  DismissInteractiveTranstion.h
//  手势移除控制器
//
//  Created by GR on 15/9/1.
//  Copyright (c) 2015年 GR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DismissInteractiveTranstion : UIPercentDrivenInteractiveTransition
- (instancetype)initWithController:(UIViewController *)vc;
@property (nonatomic, assign) BOOL interacting;// 用于判定是否需要手势过渡。
/*
 1. UIViewControllerTransitioningDelegate中的一个问题：（以present过程来举例）
    如果需要手势过渡，那么即需要动作动画控制器（UIViewControllerAnimatedTransitioning对象）也需要手势动画控制器（UIViewControllerInteractiveTransitioning对象）。但是如果只需要动作过渡,那么只需要动作动画控制器，不需要手势动画控制器。如果在动作过渡的时候返回了手势动画控制器，程序会卡死。
 2. 手势动画控制器是在手势方法调用后返回的。
 
 有了以上俩点，就能解释interacting的作用了：它是在手势方法中被赋值的，在- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator中被使用。它的作用是有手势事件时才返回手势动画控制器。
 */
@end
