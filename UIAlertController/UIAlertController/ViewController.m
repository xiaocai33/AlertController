//
//  ViewController.m
//  UIAlertController
//
//  Created by 小蔡 on 16/4/4.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "ViewController.h"
#import "AlertController.h"

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
    AlertController *alert = [AlertController alertControllerWithTitle:@"消息" message:@"详细信息" preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof(alert) weakAlert = alert;
    UIAlertAction *destructive = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"destructive");
        
        //点击确认按钮时,获取文本框的内容(这样写导致了循环引用)
        NSArray *textArray = [weakAlert textFields];
        UITextField *nameText = textArray[0];
        UITextField *pwdText = textArray[1];
        
        if ([nameText.text isEqualToString:@"123"] && [pwdText.text isEqualToString:@"456"]) {
            NSLog(@"登录成功");
        }else{
            NSLog(@"账号密码错误");
        }
        
    }];
    [alert addAction:destructive];
    
    //添加按钮
    /*
     UIAlertActionStyleDefault 默认
     UIAlertActionStyleCancel 取消
     UIAlertActionStyleDestructive 确认毁灭性的操作
     */
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel");
    }];
    
//    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"默认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"default");
//    }];
    
    [alert addAction:cancel];
    
    //[alert addAction:defaultAction];
    
    //添加文本框
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.font = [UIFont systemFontOfSize:16];
        textField.placeholder = @"account";
        textField.textColor = [UIColor blueColor];
        
        //监听文本框内容改变
        [textField addTarget:self action:@selector(didTextChange:) forControlEvents:UIControlEventEditingChanged];
        
        //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(usernameDidChange:) name:UITextFieldTextDidChangeNotification object:textField];（要在点击确定或取消的时候，销毁通知，不建议使用）
        
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"password";
        textField.font = [UIFont systemFontOfSize:16];
        textField.secureTextEntry = YES;
        textField.textColor = [UIColor greenColor];
    }];
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

//监听文本框内容改变
- (void)didTextChange:(UITextField *)textField{
    NSLog(@"%@", textField.text);
}

@end
