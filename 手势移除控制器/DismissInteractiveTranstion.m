//
//  DismissInteractiveTranstion.m
//  手势移除控制器
//
//  Created by GR on 15/9/1.
//  Copyright (c) 2015年 GR. All rights reserved.
//

#import "DismissInteractiveTranstion.h"
@interface DismissInteractiveTranstion ()
@property (nonatomic, strong) UIViewController *scVc;
@property (nonatomic, assign) BOOL shouldComplated;
@end

@implementation DismissInteractiveTranstion
- (instancetype)initWithController:(UIViewController *)vc
{
    if (self = [super init]) {
        self.scVc = vc;
        UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
        [vc.view addGestureRecognizer:panGR];
    }
    return self;
}
- (CGFloat)completionSpeed
{
    return 1 - self.percentComplete;
}
- (void)handleGestureRecognizer:(UIPanGestureRecognizer *)gr
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat translate = [gr translationInView:gr.view].x;
    CGFloat progress = translate / width;
    
    switch (gr.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.interacting = YES;
            [self.scVc dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            progress = fminf(fmax(progress, 0.0), 1.0);
            self.shouldComplated = (progress > 0.5);
            NSLog(@"%f", progress);
            [self updateInteractiveTransition:progress];
        }
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
           self.interacting = NO;
            if (!self.shouldComplated || gr.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
        }
            break;
        default:
            break;
    }
}
@end
