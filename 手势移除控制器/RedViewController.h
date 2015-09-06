//
//  RedViewController.h
//  手势移除控制器
//
//  Created by GR on 15/8/31.
//  Copyright (c) 2015年 GR. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RedViewController;
@protocol RedViewControllerDelegate <NSObject>

- (void)redViewControllerDidClickedDismissButton:(RedViewController *)vc;

@end

@interface RedViewController : UIViewController
@property (nonatomic, assign) id<RedViewControllerDelegate> delegate;
@end
