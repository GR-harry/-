//
//  RedViewController.m
//  手势移除控制器
//
//  Created by GR on 15/8/31.
//  Copyright (c) 2015年 GR. All rights reserved.
//

#import "RedViewController.h"
#import "DismissInteractiveTranstion.h"

@interface RedViewController ()
@property (nonatomic, strong) DismissInteractiveTranstion *dimissInteractiveTranstion;
@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    
    self.dimissInteractiveTranstion = [[DismissInteractiveTranstion alloc] initWithController:self];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"dismiss me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked:(UIButton *)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
