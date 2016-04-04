//
//  ViewController.m
//  UIAlertController
//
//  Created by 小蔡 on 16/4/4.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"TEST" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button.translatesAutoresizingMaskIntoConstraints = NO;
    
    //约束X 和 宽度
    NSArray *buttonX = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-130-[button]-130-|" options:0 metrics:nil views:@{@"button":button}];
    [self.view addConstraints:buttonX];
    //约束Y 和 高度
    NSArray *buttonY = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[button(50)]" options:0 metrics:nil views:@{@"button":button}];
    [self.view addConstraints:buttonY];
}

- (void)btnClick{
    /*
    UIAlertControllerStyleActionSheet: UIActionSheet样式
    UIAlertControllerStyleAlert: UIAlertView样式
     */
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"消息" message:@"详细信息" preferredStyle:UIAlertControllerStyleActionSheet];
    /*
     UIAlertActionStyleDefault 默认
     UIAlertActionStyleCancel 取消
     UIAlertActionStyleDestructive 确认毁灭性的操作
     */
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel");
    }];
    
    UIAlertAction *destructive = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"destructive");
    }];
    
//    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"默认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"default");
//    }];
    
    [alert addAction:cancel];
    [alert addAction:destructive];
    //[alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

@end
